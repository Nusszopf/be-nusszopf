function hasuraIdToken(user, context, callback) {
  const namespace = "https://hasura.io/jwt/claims";
  context.idToken[namespace] = {
    "x-hasura-default-role": "user",
    "x-hasura-allowed-roles": ["user", "anonymous"],
    "x-hasura-user-id": user.user_id,
    username: user.username,
  };
  context.accessToken[namespace] = {
    "x-hasura-default-role": "user",
    "x-hasura-allowed-roles": ["user", "anonymous"],
    "x-hasura-user-id": user.user_id,
    username: user.username,
  };
  callback(null, user, context);
}
