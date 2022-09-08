({
	getAccountData : function(component, event, helper) {
		var act = component.get('c.getAccountDataFromDatabase');
        $A.enqueueAction(act,false);
        act.setCallback(this,function(response) {
            var list1 = response.getReturnValue();
            if(list1!=null) {
                component.set('v.accList',list1);
            }
            else {
                component.set('v.msg', 'Sorry, no records are available');
            }
        });
	}
})