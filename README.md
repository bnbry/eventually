# eventually

An attempt at putting data into the right place while avoiding tight coupling. This is a presentation on the flow of data around business issues and between teams and services. This is not a technical showcase. The code is kept as simple as possible and the dependencies more so.

## how to run this project

This project is a series of dummy apps built to facilitate a brown bag presentation on message passing and data locality with behavior. It includes 4 rails apps. To run this the easiest way is to clone the repo, cd into the directory, and run the following commands.

`bundle install` to install the monorepos gems
`bundle exec rake install` to install each child apps dependencies and setup DBs
`bundle exec rake boot` to run each child apps servers and subscribers

Then open `eventually.html` in a browser once the servers are started

## information

These applications are barebones implementations in order to illustrate some ideas about organizing message based systems.

Alpha, the order processing service was the original service involved in this ecosystem and still holds on to most of the settings interfaces and canonical database storage of system wide settings.

Beta is a new client that captures orders, Alpha takes captured orders and processes them for approval, Charlie finalizes orders and charges customers.

## issues

We want to push data to where it is needed.


### Issue 1
**todo**: change_events

**problem**: The Beta Order service needs to let customers know up front when they have a fee or a discount that will be applied to their order. This information is "owned" by Alpha. Beta and Alpha need to work together to display discount and fee notices in beta.

**solution**: We could add a rest API and ask alpha every time we want to render the form in beta but meh, lets have alpha publish changes to the settings and beta can hold on to them however it wants.


### Issue 2
**todo**: transition_events

**problem**: The Alpha order processing service is not properly utilizing the discounts promised by the Beta service. This seems to happen when an order is started in Beta while the discounts are enabled in Alpha but then they are disabled in Alpha before Beta finishes submitting the order.

We can't go back to the customer and take a way discounts we already promised. We need these apps to be in sync!

**solution**: The way we'll solve this is by pushing the discount and fee information along with the order when it is captured. Alpha needs to listen to what the order says is the fee and discount rules, the settings versions are not used for in flight orders, they are only used to populate the order when the form is initially loaded in beta. After that the order has to be trusted an alpha should stop checking its own local settings for fees and discounts and trust what beta says.


### Issue 3
**todo**: change_transition

**problem**: The Charlie service needs to track the current fee setting in alpha along with the fee amount on the order in order to balance our fee ledger.

**solution**: Charlie needs to listen to Alpha settings changes but also receive the fee amount with the approved order. It needs both a the change event for settings and the robust transition event when the order is approved.


### Issue 4
**problem**: Beta needs to know when an order has been charged so that it can open orders up again. Oh wait now Alpha needs it too and will be publishing a finalize event. It turns out Beta would actually prefer the finalize event over listening for charge since it makes more sense and would continue to work if additional steps were put in after charge/etc.

**solution**: Events across the ecosystem continue to be important in more than one place. Teams need to work together to establish standardized message payloads for events and how to version to prevent breakage. Then they need to start publishing, particularly at the boundaries between teams. Publish a charge event from Charlie, consume it from Alpha, pubish a finalize event from Alpha, consume it from Beta.


### Issue 5
**problem**: We need to track these messages throughout our system, particularly in logging.

**solution**: Ensure correlation IDs are sent with and logged with whenever messages are created and consumed and any work done as an extension of consuming a message, including passing it along with any subsequent messages being sent out. This should be the Request ID if the original trigger was from a request, if it was from a background job/console/other interface, then generate a Request ID from those interfaces and pass them along just like if it was from a controller. Print this Request ID the same way in every log and reap the benefits of kibana search.
