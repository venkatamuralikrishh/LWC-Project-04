({
    displayChildComponent : function(component, event, helper) {
        var id = component.find('dynamicCmp');
        $A.createComponent(
            "lightning:button", {"label" : 'DynamicButton',
                                 "variant" : 'brand',
                                 "onclick" : component.getReference('c.diplayAlertMessage')},
            function(dButton, status, errorMessage) {
                if(status=='SUCCESS') {
                    var bn = id.get('v.body');
                    bn.push(dButton);
                    id.set('v.body',bn);
                }
            }
            
        );
    },
    removeChildComponent : function(component, event, helper) {
        var id = component.find('dynamicCmp').set('v.body',[]);
        
    },
    diplayAlertMessage : function(component, event, helper) {
        alert(event.getSource().get('v.label'));
    }
})