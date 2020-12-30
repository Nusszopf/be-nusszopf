function userPicture(user, context, cb) {
  if (user.picture.includes("cdn.auth0.com")) {
    user.picture = "none";
  }
  cb(null, user, context);
}
