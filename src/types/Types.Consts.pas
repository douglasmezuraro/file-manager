unit Types.Consts;

interface

const
  DEFAULT_COMPONENT_OFFSET = 13;
  DEFAULT_COMPONENT_WIDTH = 400;
  CHANGE_INDICATOR: array[Boolean] of string = ('', '*');

resourcestring
  SUnsavedChangesWantToExitAnyway = 'Unsaved changes, do you want to exit anyway?';
  SUnsavedChangesWantToChangeFileAnyway = 'Unsaved changes, do you want to change file anyway?';
  SFileNotFound = 'File not found: %s.';
  SFileSuccessfullySaved = 'File successfully saved!';
  SUngrouped = 'Ungrouped';
  SValueIsNotAValidValue = 'Value "%s" is not a valid "%s" value.';
  SValueCannotBeEmpty = 'Value cannot be empty.';
  SValueDoesNotMatchRegEx = 'Current value does not match regular expression.';
  SValueIsLessThenMinimumAllowedFloat = 'Current value "%f" is less than minimum allowed "%f".';
  SValueIsGreaterThenMaximumAllowedFloat = 'Current value "%f" is greater than maximum allowed "%f".';
  SValueIsLessThenMinimumAllowedInteger = 'Current value "%d" is less than minimum allowed "%d".';
  SValueIsGreaterLessThenMaximumAllowedInteger = 'Current value "%d" is greater than maximum allowed "%d".';
  SLengthOfValueIsLessThanMinimumAllowed = 'The length of the current value "%d" is less than the minimum allowed "%d".';
  SLengthOfValueIsGreaterThanMaximumAllowed = 'The length of the current value "%d" is greater than the maximum allowed "%d".';
  SClassShouldBeRegistrated = 'Class "%s" should be registrated in the initialization section.';

implementation

end.

