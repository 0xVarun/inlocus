const nodemailer 	= require('nodemailer');
const sgTransport	= require('nodemailer-sendgrid-transport');



/**module.exports = */function mail(otp, email) {

	let options = {
		auth: {
			api_user: 'varuntewari26',
			api_key: "Reset@123"
			// api_key: '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'
		}
	}

	let client = nodemailer.createTransport(sgTransport(options));
	
	let emailObject = {
	  from: 'varun@beaconstalk.com',
	  to: email,
	  subject: 'One Time Password',
	  text: otp,
	  html: `<b>${otp}</b>`
	};

	client.sendMail(emailObject, function(err, info){
	    if (err){
	      console.log(err);
	    }
	    else {
	      console.log('Message sent: ' + info);
	    }
	});
}

module.exports = mail