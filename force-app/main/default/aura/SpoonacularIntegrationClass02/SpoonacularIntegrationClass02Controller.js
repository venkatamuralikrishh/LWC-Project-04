({
    getFoodRecipeFromSpoonacular : function(component, event, helper) {
        var act = component.get('c.spoonacularGetMethod');
        $A.enqueueAction(act,true);
        act.setCallback(this, function(response) {
            var map1 = response.getReturnValue();
            component.set('v.data',map1);
            var list1 = component.get('v.data')['results'];
            component.set('v.dataToDisplayInTable',list1);
        });
    }
})