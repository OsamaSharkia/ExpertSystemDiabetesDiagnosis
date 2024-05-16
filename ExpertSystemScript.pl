% Declare predicates as dynamic and possibly non-contiguous
:- dynamic symptom/2.
:- dynamic risk_factor/2.
:- dynamic fasting_glucose/2.
:- dynamic hbA1c/2.
:- discontiguous symptom/2.
:- discontiguous risk_factor/2.
:- discontiguous fasting_glucose/2.
:- discontiguous hbA1c/2.

% Symptoms - Group all symptom facts together
symptom(patient1, increased_thirst).
symptom(patient1, frequent_urination).
symptom(patient2, frequent_urination).

% Risk factors - Group all risk factor facts together
risk_factor(patient1, obesity).
risk_factor(patient2, high_blood_pressure).

% Fasting glucose levels - Group all fasting glucose facts together
fasting_glucose(patient1, 130).
fasting_glucose(patient2, 110).

% HbA1c levels - Group all HbA1c facts together
hbA1c(patient1, 7.0).
hbA1c(patient2, 5.5).

% Rules to determine increased risk based on symptoms and risk factors
diabetes_risk(PatientID) :-
    symptom(PatientID, increased_thirst),
    symptom(PatientID, frequent_urination),
    risk_factor(PatientID, obesity).

% Rule to diagnose diabetes based on fasting glucose levels, HbA1c levels, and risk factors
diagnose(PatientID, diabetes) :-
    (   fasting_glucose(PatientID, Level), Level >= 126
    ;   hbA1c(PatientID, Hba1cLevel), Hba1cLevel >= 6.5
    ),
    diabetes_risk(PatientID).

% Rule to diagnose diabetes based only on high fasting glucose levels or HbA1c levels
diagnose(PatientID, diabetes) :-
    (   fasting_glucose(PatientID, Level), Level >= 126
    ;   hbA1c(PatientID, Hba1cLevel), Hba1cLevel >= 6.5
    ).

% Dynamic data addition functions with confirmation messages
% Add new symptom data
add_symptom(PatientID, Symptom) :-
    assertz(symptom(PatientID, Symptom)),
    format('Symptom ~w for ~w added successfully.~n', [Symptom, PatientID]).

% Add new risk factor data
add_risk_factor(PatientID, Risk) :-
    assertz(risk_factor(PatientID, Risk)),
    format('Risk factor ~w for ~w added successfully.~n', [Risk, PatientID]).

% Add new fasting glucose level data
add_glucose_level(PatientID, Level) :-
    assertz(fasting_glucose(PatientID, Level)),
    format('Fasting glucose level ~w for ~w added successfully.~n', [Level, PatientID]).

% Add new HbA1c level data
add_hba1c(PatientID, Level) :-
    assertz(hbA1c(PatientID, Level)),
    format('HbA1c level ~w for ~w added successfully.~n', [Level, PatientID]).

% Removing data functions with confirmation messages
% Remove symptom data
remove_symptom(PatientID, Symptom) :-
    retract(symptom(PatientID, Symptom)),
    format('Symptom ~w for ~w removed successfully.~n', [Symptom, PatientID]).

% Remove risk factor data
remove_risk_factor(PatientID, Risk) :-
    retract(risk_factor(PatientID, Risk)),
    format('Risk factor ~w for ~w removed successfully.~n', [Risk, PatientID]).

% Remove fasting glucose level data
remove_glucose_level(PatientID) :-
    retract(fasting_glucose(PatientID, _)),
    format('Fasting glucose level for ~w removed successfully.~n', [PatientID]).

% Remove HbA1c level data
remove_hba1c(PatientID) :-
    retract(hbA1c(PatientID, _)),
    format('HbA1c level for ~w removed successfully.~n', [PatientID]).

% Query to show symptoms of a patient with existence check
show_symptoms(PatientID) :-
    findall(Symptom, symptom(PatientID, Symptom), Symptoms),
    (   Symptoms \= []
    ->  format('Symptoms for ~w: ~w~n', [PatientID, Symptoms])
    ;   format('No symptoms found for ~w. It seems the patient does not exist.~n', [PatientID])
    ).

% Query to show risk factors of a patient with existence check
show_risk_factors(PatientID) :-
    findall(Risk, risk_factor(PatientID, Risk), Risks),
    (   Risks \= []
    ->  format('Risk factors for ~w: ~w~n', [PatientID, Risks])
    ;   format('No risk factors found for ~w. It seems the patient does not exist.~n', [PatientID])
    ).

% Query to show fasting glucose levels of a patient with existence check
show_glucose_levels(PatientID) :-
    findall(Level, fasting_glucose(PatientID, Level), Levels),
    (   Levels \= []
    ->  format('Fasting glucose levels for ~w: ~w~n', [PatientID, Levels])
    ;   format('No fasting glucose levels found for ~w. It seems the patient does not exist.~n', [PatientID])
    ).

% Query to show HbA1c levels of a patient with existence check
show_hba1c_levels(PatientID) :-
    findall(Level, hbA1c(PatientID, Level), Levels),
    (   Levels \= []
    ->  format('HbA1c levels for ~w: ~w~n', [PatientID, Levels])
    ;   format('No HbA1c levels found for ~w. It seems the patient does not exist.~n', [PatientID])
    ).

% Example queries to test the system
% To run, type the query without the comment sign (%) in the Prolog console
% ?- diagnose(patient1, diabetes).
% ?- diagnose(patient2, diabetes).
% ?- show_symptoms(patient3).
% ?- show_risk_factors(patient3).
% ?- show_glucose_levels(patient3).
% ?- show_hba1c_levels(patient3).
