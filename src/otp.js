const { Auth, LoginCredentials } = require("two-step-auth");
  
async function login(emailId) {
  try {
    const res = await Auth(emailId, "CompanyName");
    console.log(res);
    console.log(res.mail);
    console.log(res.OTP);
    console.log(res.success);
  } catch (error) {
    console.log(error);
  }
}
  
// This should have less secure apps enabled
LoginCredentials.mailID = "yourmailId@anydomain.com"; 
  
// You can store them in your env variables and
// access them, it will work fine
LoginCredentials.password = "Your password"; 
LoginCredentials.use = true;
  
// Pass in the mail ID you need to verify
login("verificationEmail@anyDomain.com"); 