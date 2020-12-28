function syncWithHasura(user, context, cb) {
  const jwt = require("jsonwebtoken");
  const fetch = require("node-fetch");
  if (user.app_metadata && user.app_metadata.synced_with_hasura) {
    cb(null, user, context);
  } else {
    const userId = /.+\|.+/g.test(user.user_id) ? user.user_id : `auth0|${user.user_id}`;
    const query = `
		mutation($userId:String!,$userEmail:String!){
			insert_users(objects:[{id:$userId,email: $userEmail}],
			on_conflict:{constraint: user_pkey,update_columns:[]}){affected_rows}}`;
    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-hasura-admin-secret": "Mi2w4pKIHQngrqHES6MqubryQZadmD",
      },
      body: JSON.stringify({ query, variables: { userId: userId, userEmail: user.email } }),
    };
    fetch("https://nz-hasura-prod.herokuapp.com/v1/graphql", options)
      .then(() => {
        user.app_metadata = user.app_metadata || {};
        user.app_metadata.synced_with_hasura = true;
        return auth0.users.updateAppMetadata(user.user_id, user.app_metadata);
      })
      .then(() => {
        if (user.user_metadata && user.user_metadata.newsletter === "true") {
          const token = jwt.sign(
            { id: userId, name: user.username, email: user.email },
            "XWWtPQA6NLgAOj858lyyfOaIUdzD5O",
            { expiresIn: "1d" }
          );
          return fetch("https://nusszopf.org/api/newsletter", {
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