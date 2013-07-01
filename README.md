![Feowl Logo](http://www.feowl.com/comingsoon/assets/feowl_150px.png)

Feowl will provide the citizens, journalists and businesses of Douala, Cameroon, with reliable data about the electricity supply. Local media will leverage a network of SMS-enabled contributors, whom the Feowl platform will automatically poll at regular intervals.

Feowl is financed by the International Press Institute's News Contest.
If you are a developer, a designer, a statistician, an electricity specialist, a venture capitalist or an owl breeder and want to help us make Feowl fly, drop us a line at contact@feowl.com

# Feowl User Interface
## Installation
### Dependancies
You must have a basic Apache and PHP environement:

	sudo apt-get install apache2 php5 libapache2-mod-php5 php5-curl

### System configuration
The Kohana installation <b>must be in a directory <em>/</em> from the root of your virtual host or domain</b>.

Also, you have to allow writing on <em>./tmp</em>, <em>./logs</em> directories (replace 	&lt;path> by the path of the Feowl directory):

	chmod 777 -Rf ./logs ./tmp

### API access, Sendgrid access
Every Feowl installation must use a unique key for the API. [Do not hesitate to ask for a key!](mailto:contact@feowl.com)
To setup your keys, from the Feowl directory use the following environement variables:
	
	API_USERNAME
	API_KEY
	SENDGRID_USERNAME
	SENDGRID_PASSWORD

You can otherwise edit the file under application/config but be carefull to not send it to git.

### Generate locales
From the root directory, type :

	php index.php --uri="i18nget/generate"