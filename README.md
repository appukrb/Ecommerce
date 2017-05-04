# Android Application for leasing residences

## Introduction

### Description of E-commerce

Electronic commerce (e-commerce) is a type of a business model, or a segment of a larger business model, that enables a firm or an individual to conduct business over an electronic network, typically the Internet. Electronic commerce operates in all four of the major market segments: business to business, business to consumer, consumer to consumer and consumer to business. Almost any product or service can be offered via e-commerce, from books and music to financial services and plane tickets. E-commerce has allowed firms to establish a market presence, or to enhance an existing market position, by providing a cheaper and more efficient distribution chain for their products or services.

There are several types of electronic commerce. The most common is business to consumer, in which a business sells products or services directly to consumers over the Internet. An example of a business to consumer e-commerce transaction would be to individually purchasing a pair of sneakers through Nike's website. As of business to business type of electronic commerce, companies can sell their products or services to other companies over the Internet. An example would be the company GoDaddy, which sells domain names, websites, and hosting services to other businesses. Consumer to business electronic commerce involves consumers selling products or services to businesses. You've taken part in this form of e-commerce if you've ever completed an online payment survey where you've given your opinion about a product. Finally, regarding consumer to consumer e-commerce, consumers can sell products to other consumers via a website such as Amazon or eBay.

The rise of e-commerce forces IT personnel to move beyond infrastructure design and maintenance and consider numerous customer-facing aspects such as consumer data privacy and security. When developing IT systems and applications to accommodate e-commerce activities, several things must be taken into consideration, like data governance related regulatory compliance mandates, personally identifiable information privacy rules and information protection protocols.

Some benefits of e-commerce include its around-the-clock availability, the speed of access, the wide availability of goods and services for the consumer, easy accessibility, and international reach. Its perceived downsides include sometimes-limited customer service, consumers not being able to see or touch a product prior to purchase, and the necessitated wait time for product shipping.
  
  ### Purpose of the application
  
  As described above, e-commerce has changed the way commerce is performed for both products and services. One of the fields affected by e-commerce is tourism. Many sites and applications are implemented in order to facilitate all relevant services and transactions, like Booking, TripAdvisor, Airbnb, Trivago etc.
  
  The purpose of this project is the development of an Android Application for booking rooms/residences, enabling users to lease or rent short-term lodging including vacation rentals, apartment rentals, homestays, hostel beds, or hotel rooms. Therefore, in this application each user can have two roles. Once someone is registered, by default has the tenant (user) role. This means that he can search a residence, make a reservation, review/comment, check the inbox and send messages etc. However, there is also the ability to take over the role of host and upload information regarding residences for booking, followed by specific characteristics and availability periods.
  
  ## Connection details
  
  ### MySQL DataBase
  
  For the successful initialization of the application, seven tables have been created: users, residences, rooms, reservations, reviews, conversations and messages.
  
  * __Users:__ The fields of this table describe all necessary information for all the users registered into the application, both tenants and hosts.The mandatory fields, in order for the user to be valid, are: first name, last name, username, password and email. However, there is extra information that can be filled out later by the user. In this table, we also store the information of the role of each user (host role is enabled or not). By default host role is disabled, unless user decides to upload a residence and extend his role to host.
  * __Residences:__ In this table all the residences, entered by hosts, are described. Specifically, the information stored is: the owner, the type (house, apartment or single room), location details, short description and characteristics, cancellation policy, rules, available dates and price information of the residence. The information stored here descibes generally the residences, however it is not related to reservations, since a residence can have more than one room and different users should have the chance to book these rooms during the same period.
  * __Rooms:__ Considering the above that several users should have the opportunity to make a reservation during the same period, a table named "rooms" was created, where more specific information is contained, such as number of beds, available bathrooms and more. The field "residence_id" connects each room with its parent residence (foreign_key).
  * __Reservations:__ This table is used in order to store all data related to reservations that users have made. The main fields are: room_id, tenant_id, host_id, period and number of guests.
  * __Reviews:__ In the application, the user can rate and comment each visited residence. Therefore, a review table is needed to keep this information.
  * __Conversations:__ An inbox service is provided to the users, where they can see messages from other users (either hosts or tenants) and reply back to them. All messages are grouped based on the subject of the conversation. As a result, two tables are created. In this table, the only necessary fields are the sender's and receiver's (user) id and the subject of the conversation.
  * __Messages:__ In addition to the above, there is the messages table with more data, such as the body of the message and a timestamp of the date in order to keep in track every action of sending/receiving and make a proper management. Moreover, the messages are linked to a conversation ("converations" table) based on the field "conversation\_id", in order for all the messages with the same subject to be grouped together.
  
  All above tables have a field id which is unique and auto-increment. 
  For our Database Model to become more clear, an Entity Relationship model was designed, showing only the most important fields of the Database, as per below:
  
  ![Entity Relationship Model] (https://drive.google.com/open?id=0B6sh2sNO52YecFhNNFhJTXVwbWc)
  
  In above Model, all entities, their relationship and the main fields are shown. All primary keys are underlined and the foreign keys are emphasized with Italics. 
    
	Furthermore, the Enhanced Entity Relationship Model was extracted from MySQL Workbench, also showing the relations between the tables.
  
  ![Enhanced Entity Relationship Model] (https://drive.google.com/open?id=0B6sh2sNO52YeUFdJNmlLRjhxME0)
  
  ### RESTful Services
  
  The way that the application communicates with the stored information, relies absolutely to the implementation of RESTful web services. REST describes any simple interface that transmits data over a standardized interface (such as HTTP). It provides an architectural set of design rules for creating stateless services that are viewed as resources, or sources of specific information (data and functionality). Each resource can be identified by its unique Uniform Resource Identifiers (URIs). Consequently, a client (either a consumer or a business) accesses a resource using only a URI that returns the proper information needed, in a specific format that the client can handle as they want. No extra keys or credentials are required for this connection as the permissions for this access have already been set between the client and the provider of the REST service.
  
  In the world of E-commerce there is a variety of such services (like REST, SOAP or XML-RPC) that serve easily and quickly all kind of needs that clients have. For example, an e-shop can integrate several types of services into its website or application, depending always on the documentation and the standards that each service provides.
  
  Analyzing the process of an online payment, when the buyer has selected their products and proceeds to checkout, they have to fill in the credentials of their credit card in order to be confirmed as valid users. If the validation is successful, the user makes the transaction and therefore completes the checkout procedure of the product. For this operation to be handled correctly, a connection with a payment web service has already been executed (for example a physical Bank or an online Payment Service - where the latter is supported to web services too). The website doesn't have any access to the payment account credentials of each user, that's why it must connect with a Web Service, enabling the users to withdraw their money from there, and continue shopping from the website. 
  
  This procedure can be achieved with different ways, either by internal calls to the URIs of the web service through the website, or by redirection to the URIs of the Web Services that in this case, their return format, is a more user friendly environment that can guide the user to any completion steps presented. In this way, the domain of security is also supported, as each side (client and provider) has its own permissions specified, getting only the data that is considered qualified. Even the techniques used by the clients for each Web Service can vary on the permissions restrictions and the level of the risk of vulnerability from attackers.
 
 Other cases that the Web Services work on, are the known electronic malls (e-malls) that use a variety of connections of plenty e-shops and collect information of all kinds of products grouped by price, brand etc. A real case is the *Skroutz* web platform which provides URIs to its' clients in order for them to send their products list externally (in an XML format for example) and manage to be visible from other sources as well.
  
  **Connection with MySQL:** For the successful operation of the RESTful Web Service, specific methods that read or write on a database must be constructed, and provide their result publicly. In more details, all the tables of the database are imported and used through MySQL queries. The desired return format that is used is JSON (could be XML, plain text, boolean, numbers etc). In practice, for viewing the list of available residences provided into the Android application, a call to the Web Service is being made, asking for the list of all the residences (that have already been added through a similar way). Next, RESTful gets triggered, and makes a connection with the database. It selects all the data from the table "residences", respecting any declared parameters or attributes, and the result (returned Array/Object/String etc) is converted to a serialized JSON value. Then it's up to the Android program to read this response, and handle it properly. Below is shown a response of a REST call that brings all the available residences from the database.
  
  Something important that has to be mentioned, is the fact that the RESTful Web Service and the database should exist under the same technical environment / server, or at least under the same network. In this way, we can ensure the safety of the database, without having it open to the rest of the world and increase its vulnerability. The external client can be connected from everywhere, as it only needs a URI and the correct guidelines to make its application run.
  
  ## Android Application
  
  In this section, all screens of the application will be described, including the design decisions and the functionalities used. 
  
  Apart from that, it is important to mention here, how our Android Application consumes above RESTful Services. For this purpose, two classes have been created, the first one is class RestCallParameters, which contains all necessary information of a request, such as the URL, the request type (GET or POST), the return type (JSON or Plain Text) and in case of a POST request the message to be stored in the database. In addition, a class named RestCallManager is implemented. This is a different thread from main, which runs in the background, and once finished returns the JSON Object or the text from the RESTful Services.
  
  Furthermore, related to POST requests, the application should sent also the user input. For this purpose, the input is stored each time to a HashMap using as key the same name with the relevant field in the database and as value the user's input (i.e. for your reference "RegisterParameters.java"). 
    
  ### Register/Log in
  
  The first screen of our application is related to GreetingActivity.java and activity_greeting.xml, welcomes the user to the application and gives him the choice either to log in to the application, if he has already an account, or to register. However, this screen appears only the first time user enters the application or if he logs out. When user is logged in, the first screen that appears is the home screen.
  
  When user clicks on Register button, a new screen appears (RegisterActivity.java and activity_register.xml) with mandatory fields to be completed by user. The fields are: first name, last name, email (used instead of a username by user in order to log in to the application), password and cofirm password. Our application, checks if user is already registered to the applicaiton, based on the email used and checks whether password and confirmation are identical. Finally, when user presses the button for completion of the registration, a POST request is sent to the database, storing the data to the relevant table. In order to send the POST request, android application creates a JSON Object and provides it to the RESTful services. There, it is checked if username or email already exist and returns a response to the application whether the registration was successful or not. Based on this response, android application shows a message to user, either letting him to proceed to the Home Screen or asking him to refill the mandatory fields.
  
