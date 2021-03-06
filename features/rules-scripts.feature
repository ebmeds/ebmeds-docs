Feature: General properties for script-based reminders

  Much of EBMEDS' functionality is due to clinician-written javascript rules, so-called scripts. These are the main features concerning the informational contents of the reminders generated by the scripts. There are other types of reminders, but in this document we mean "script reminders" when we say "reminders".

  Background:
    Given a patient "Adam"
    And a medical professional "Dumbledore"
    And Dumbledore calls EBMEDS with Adam's patient info
    And unless otherwise stated, Adam's patient info is such that every script that is run in EBMEDS generates a reminder regarding Adam

  Scenario: return reminders to a doctor
    Given that Dumbledore is a doctor and that fact is recorded in the request message
    Then Dumbledore receives reminders that have texts geared towards doctors (a short and a long version). The texts may be empty strings(!)

  Scenario: return reminders to a nurse
    Given that Dumbledore is a nurse and that fact is recorded in the request message
    Then Dumbledore receives reminders that have texts geared towards nurses (a short and a long version). The texts may be empty strings(!)

  Scenario: return reminders to a citizen
    Given that Adam wants to receive reminder texts geared to him
    Then Adam receives reminders that have texts geared towards citizens. The texts may be empty strings(!)

  Scenario: sort reminders according to importance
    Given that Dumbledore has received some reminders regarding Adam
    Then the generated reminders contain an urgency code (0 = reminder, 1 = prompt, 2 = alert) to enable sorting and UI categorization

  Scenario: identify which rule corresponds to which reminder
    Given that Dumbledore has received some reminders regarding Adam
    Then the generated reminders contain a reference to the rule that generated the reminder, as well as a unique ID to identify the reminder globally

