function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    baseurl: 'https://gorest.co.in/public/v2/users/',
    token: '0629530b6400b7264182cad25f2e323d149e43450e34f1577c7978609d2f54e9',
    id: ''
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}