function userPicture(user, context, cb) {
  const fetch = require("node-fetch");
  const isSocialAccount = user.user_id.includes("google") || user.user_id.includes("apple");
  if (!isSocialAccount) {
    cb(null, user, context);
  }
  const query = `
		mutation($userId:String!,$userPicture:String!){
      update_users_by_pk(pk_columns:{id:$userId},_set:{picture:$userPicture}){id}
    }`;
  const options = {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "x-hasura-admin-secret": "my-admin-secret", // todo: replace 'my-admin-secret'
    },
    body: JSON.stringify({ query, variables: { userId: user.user_id, userPicture: user.picture } }),
  };
  fetch("https://nz-hasura-prod.herokuapp.com/v1/graphql", options)
    .then(() => {
      cb(null, user, context);
    })
    .catch(() => {
      cb(null, user, context);
    });
}
