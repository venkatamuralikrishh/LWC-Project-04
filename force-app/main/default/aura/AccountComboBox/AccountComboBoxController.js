({
    myAction : function(component, event, helper) {
        var accRecords = component.get('c.getAccountDetails');
        $A.enqueueAction(accRecords,false);
        accRecords.setCallback(this, function(response) {
            var rs1 = response.getReturnValue();
            component.set('v.valuesList',rs1);
            var items = [];
            var item = {"label":'--None--',"value":'--None--'};
            items.push(item);
            for(var i=0; i<rs1.length; i++) {
                var item1 = {"label":rs1[i].Name,"value":rs1[i].Name};
                items.push(item1);
            }
            component.set('v.accListInPicklist',items);
        });
        
    },
    displayRecord : function(component, event, helper) {
        component.set("v.cols", [
            {label : 'Account Name', fieldName :'Name', type : 'text'}
        ]);
        var accRecord = component.get('c.fetchData');
        var val = component.get('v.valuesList');
        accRecord.setParam("nm",val);
        $A.enqueueAction(accRecord,false);
        
        accRecord.setCallback(this, function(response) {
            var accObject = response.getReturnValue();
            component.set('v.data',accObject);
        });
    }
})