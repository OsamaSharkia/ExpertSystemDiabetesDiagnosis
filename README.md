# ExpertSystemDiabetesDiagnosis
Prolog-based expert system for diagnosing diabetes mellitus
# Expert System for Diabetes Diagnosis

This repository contains a Prolog-based expert system designed to assist healthcare professionals in diagnosing diabetes mellitus by analyzing patient symptoms, medical history, and diagnostic test results.

## Getting Started

### Prerequisites
- Install [SWI-Prolog](https://www.swi-prolog.org/Download.html)

### Installation
1. Clone the repository to your local machine:
    ```bash
    git clone https://github.com/yourusername/ExpertSystemDiabetesDiagnosis.git
    ```
2. Navigate to the repository directory:
    ```bash
    cd ExpertSystemDiabetesDiagnosis
    ```

### Running the Expert System

1. Open SWI-Prolog.
2. Load the Prolog script:
    ```prolog
    ?- [ExpertSystemScript].
    ```
3. Run example queries to test the system:
    ```prolog
    % Adding a new patient with symptoms and testing for diagnosis
    ?- add_symptom(patient3, 'Increased Thirst').
    % Output: Symptom 'Increased Thirst' for patient3 added successfully.
    
    ?- add_symptom(patient3, 'Frequent Urination').
    % Output: Symptom 'Frequent Urination' for patient3 added successfully.

    ?- add_risk_factor(patient3, 'Obesity').
    % Output: Risk factor 'Obesity' for patient3 added successfully.

    ?- add_glucose_level(patient3, 128).
    % Output: Fasting glucose level 128 for patient3 added successfully.

    ?- add_hba1c(patient3, 7.0).
    % Output: HbA1c level 7.0 for patient3 added successfully.

    % Diagnosing the patient
    ?- diagnose(patient3, diabetes).
    % Output: true

    % Modifying existing patient data and observing confirmation messages
    ?- remove_symptom(patient3, 'Frequent Urination').
    % Output: Symptom 'Frequent Urination' for patient3 removed successfully.
    
    ?- add_symptom(patient3, 'Blurred Vision').
    % Output: Symptom 'Blurred Vision' for patient3 added successfully.

    % Diagnosing the patient again
    ?- diagnose(patient3, diabetes).
    % Output: true or false based on new data

    % Checking a patient with lower glucose level
    ?- add_symptom(patient4, 'Frequent Urination').
    % Output: Symptom 'Frequent Urination' for patient4 added successfully.
    
    ?- add_glucose_level(patient4, 120).
    % Output: Fasting glucose level 120 for patient4 added successfully.

    % Diagnosing the patient
    ?- diagnose(patient4, diabetes).
    % Output: false

    % Showing symptoms of a patient
    ?- show_symptoms(patient3).
    % Output: Symptoms for patient3: ['Increased Thirst', 'Blurred Vision']

    % Trying to show symptoms of a non-existent patient
    ?- show_symptoms(patient5).
    % Output: No symptoms found for patient5. It seems the patient does not exist.
    ```

## Reflection on the Implementation Process

The development of this expert system involved defining a clear scope and objectives, identifying relevant medical criteria, designing a comprehensive knowledge base, and formulating logical rules. The project emphasized the importance of dynamic data handling, thorough testing, and user-friendly interactions.

### Challenges Faced:
1. **Dynamic Data Handling**: Ensuring the system could dynamically add and remove facts was a challenge due to Prolog's handling of static and dynamic predicates.
2. **Rule Complexity**: Creating comprehensive rules that accurately diagnose based on multiple criteria required careful planning and testing.
3. **Error Handling**: Implementing error messages and confirmation messages to improve user interaction and debugging was crucial.

### Lessons Learned:
1. **Thorough Testing**: Regular testing with various scenarios helps identify issues early and ensures system accuracy.
2. **Prolog Proficiency**: Improved understanding of Prolog’s strengths in logic programming and how to leverage its features effectively.
3. **System Design**: Importance of clear and modular system design for readability and maintenance.

### Recommendations for Future Enhancements:
1. **Expand Knowledge Base**: Include more detailed medical history and additional diagnostic tests.
2. **User Interface**: Develop a user-friendly interface for inputting patient data and retrieving diagnoses.
3. **Integration with EHR**: Allow the system to pull patient data directly from Electronic Health Records (EHR) systems to automate the input process.

## License
This project is licensed under the MIT License.
