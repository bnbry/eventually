# eventually

An attempt at putting data into the right place while avoiding tight coupling.

## information

These applications are barebones implementations in order to illustrate some ideas about organizing message based systems.

Alpha, the order processing service was the original service involved in this ecosystem and still holds on to most of the settings interfaces and canonical database storage of system wide settings.

Beta is a new client that captures orders, Alpha takes captured orders and processes them for approval, Charlie finalizes orders and charges customers.

## issues

### Issue 1
todo: change_events

problem: The Beta Order service needs to let customers know up front when they have a fee or a discount that will be applied to their order. This information is "owned" by Alpha. Beta and Alpha need to work together to display discount and fee notices in beta.

solution: We could add a rest API and ask alpha every time we want to render the form in beta but meh, lets have alpha publish changes to the settings and beta can hold on to them however it wants.


### Issue 2
todo: transition_events

problem: The Alpha order processing service is not properly utilizing the discounts promised by the Beta service. This seems to happen when an order is started in Beta while the discounts are enabled in Alpha but then they are disabled in Alpha before Beta finishes submitting the order.

We can't go back to the customer and take a way discounts we already promised. We need these apps to be in sync!

solution: The way we'll solve this is by pushing the discount and fee information along with the order when it is captured. Alpha needs to listen to what the order says is the fee and discount rules, the settings versions are not used for in flight orders, they are only used to populate the order when the form is initially loaded in beta. After that the order has to be trusted an alpha should stop checking its own local settings for fees and discounts and trust what beta says.


### Issue 3
todo: change_transition

problem: The Charlie service needs to track the current fee setting in alpha along with the fee amount on the order in order to balance our fee ledger.

solution: Charlie needs to listen to Alpha settings changes but also receive the fee amount with the approved order. It needs both a the change event for settings and the robust transition event when the order is approved.
