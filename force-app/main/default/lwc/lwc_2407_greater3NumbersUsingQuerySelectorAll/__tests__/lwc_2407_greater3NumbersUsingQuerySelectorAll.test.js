import { createElement } from 'lwc';
import Lwc_2407_greater3NumbersUsingQuerySelectorAll from 'c/lwc_2407_greater3NumbersUsingQuerySelectorAll';

describe('c-lwc-2407-greater3-numbers-using-query-selector-all', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('TODO: test case generated by CLI command, please fill in test logic', () => {
        // Arrange
        const element = createElement('c-lwc-2407-greater3-numbers-using-query-selector-all', {
            is: Lwc_2407_greater3NumbersUsingQuerySelectorAll
        });

        // Act
        document.body.appendChild(element);

        // Assert
        // const div = element.shadowRoot.querySelector('div');
        expect(1).toBe(1);
    });
});