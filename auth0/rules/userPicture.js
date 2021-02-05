function userPicture(user, context, cb) {
  const fetch = require("node-fetch");
  const isSocialAccount = user.user_id.includes("google") || user.user_id.includes("apple");
  if (!isSocialAccount) {
    cb(null, user, context);
  } else {
    const isTestUser = user.user_metadata && user.user_metadata.isTestUser === "true";
    const hasuraUrl = isTestUser ? "https://nz-hasura-stage.herokuapp.com/v1/graphql" : "https://nz-hasura-prod.herokuapp.com/v1/graphql";
    const hasuraSecret = isTestUser ? "<hasura-stage-secret>" : "<hasura-prod-secret>"; // todo: replace '<hasura-<env>-secret>'
    const query = `
		mutation($userId:String!,$userPicture:String!){
      update_users_by_pk(pk_columns:{id:$userId},_set:{picture:$userPicture}){id}
    }`;
    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-hasura-admin-secret": hasuraSecret,
      },
      body: JSON.stringify({ query, variables: { userId: user.user_id, userPicture: user.picture } }),
    };
    fetch(hasuraUrl, options)
      .then(() => {
        cb(null, user, context);
      })
      .catch(() => {
        cb(null, user, context);
      });
  }
}
