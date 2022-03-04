function fn() {
 var env = karate.env;
 karate.log('System Property:', env);
 if (!env) {
   env = 'IOS';
 }

//For IOS
 var config = {
   env: env,
   myVarName: 'MyObservatory',
   //endpoint
   baseUrl: 'https://pda.weather.gov.hk/locspc/data/fnd_e.xml'
}

//For Android
 if (env == 'Android') {
 //Android endpoint
    config.baseUrl = 'https://pda.weather.gov.hk/locspc/android_data/fnd_e.xml' ;
 }

 return config;
}