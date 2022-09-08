({
	displayAccountData : function(component, event, helper) {
		var a = component.get('v.text');
        var act = component.get('c.getDataFromDatabase');
        $A.enqueueAction(act,false);
        act.setParam('name',a);
        act.setCallback(this,function(response){
            var rs1 = response.getReturnValue();
            if(rs1 != '') {
                component.set('v.accListToDisplay',rs1);
            }
            else {
                component.set('v.msg','Sorry,records are not available');
            }
        });
	}
})