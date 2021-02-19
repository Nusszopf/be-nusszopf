function syncWithHasura(user, context, cb) {
  const jwt = require("jsonwebtoken");
  const fetch = require("node-fetch");
  if (user.app_metadata && user.app_metadata.synced_with_hasura) {
    cb(null, user, context);
  } else {
    const isTestUser = user.user_metadata && user.user_metadata.isTestUser === "true";
    const hasuraUrl = isTestUser ? "https://nz-hasura-stage.herokuapp.com/v1/graphql" : "https://nz-hasura-prod.herokuapp.com/v1/graphql";
    const hasuraSecret = isTestUser ? "<hasura-stage-secret>" : "<hasura-prod-secret>"; // todo: replace '<hasura-<env>-secret>'
    const newsletterUrl = isTestUser ? "https://web.dev.nusszopf.org/api/newsletter" : "https://nusszopf.org/api/newsletter";
    const userId = /.+\|.+/g.test(user.user_id) ? user.user_id : `auth0|${user.user_id}`;
    const userName = user.username ? user.username : user.name ? user.name.split("@")[0] : user.nickname ? user.nickname.split("@")[0] : user.email.split("@")[0];
    const query = `
		mutation($userId:String!,$userName:String!,$userEmail:String!){
			insert_users(objects:[{id:$userId,name:$userName,email:$userEmail}],
      on_conflict:{constraint: user_pkey,update_columns:[]}){affected_rows}
    }`;
    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-hasura-admin-secret": hasuraSecret,
      },
      body: JSON.stringify({ query, variables: { userId, userName, userEmail: user.email } }),
    };
    fetch(hasuraUrl, options)
      .then(() => {
        user.app_metadata = user.app_metadata || {};
        user.app_metadata.synced_with_hasura = true;
        return auth0.users.updateAppMetadata(user.user_id, user.app_metadata);
      })
      .then(() => {
        if (user.user_metadata && user.user_metadata.newsletter === "true") {
          // todo: replace '<my-email-secret>'
          const token = jwt.sign({ id: userId, name: userName, email: user.email }, "<my-email-secret>", {
            expiresIn: "1d",
          });
          return fetch(newsletterUrl, {
            method: "POST",
            headers: { "content-type": "application/json" },
            body: JSON.stringify({ token, action: "auth0SyncHasura" }),
          });
        } else {
          cb(null, user, context);
        }
      })
      .then(() => {
        cb(null, user, context);
      })
      .catch(() => {
        cb(null, user, context);
      });
  }
}
