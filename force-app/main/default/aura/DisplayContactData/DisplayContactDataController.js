({
    myAction : function(component, event, helper) {
        component.set('v.conColData', [
            {label : "Name", fieldName : "Name", type : "text"},
            {label : "Account Name", fieldName : "AccountId", type : "lookup"},
            {label : "Email", fieldName : "Email", type : "Email"},
        ]);
            var input = component.get('v.name');
            var act = component.get('c.getContactData');
            $A.enqueueAction(act,false);
            act.setCallback(this, function(response) {
            var conList = response.getReturnValue();
            var conList1 =[];
                      for(var i=0;i<conList.length;i++) {
            if(conList[i].Name.startsWith(input)) {
                conList1.push(conList[i]);
            }
        }
            component.set('v.conTableData',conList1);
    });
}
 })