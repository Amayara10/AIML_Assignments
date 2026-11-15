
% Patient Facts
patient(gauri).
patient(vaishnavi).
patient(rahul).
patient(priya).
patient(amit).

% Doctor Facts
doctor(dr_sharma).
doctor(dr_patil).
doctor(dr_mehta).
doctor(dr_joshi).
doctor(dr_kulkarni).

% Department Facts
department(general_medicine).
department(ophthalmology).
department(gastroenterology).
department(dermatology).
department(cardiology).

% Patient Symptoms
symptom(gauri, fever).
symptom(gauri, cough).

symptom(vaishnavi, headache).
symptom(vaishnavi, eye_pain).

symptom(rahul, stomach_pain).
symptom(rahul, vomiting).

symptom(priya, skin_rash).
symptom(priya, itching).

symptom(amit, chest_pain).
symptom(amit, breathing_problem).

% Doctor Specializations
specialist(dr_sharma, general_medicine).
specialist(dr_patil, ophthalmology).
specialist(dr_mehta, gastroenterology).
specialist(dr_joshi, dermatology).
specialist(dr_kulkarni, cardiology).

% Symptom and Department Relationships
needs_department(fever, general_medicine).
needs_department(cough, general_medicine).

needs_department(headache, ophthalmology).
needs_department(eye_pain, ophthalmology).

needs_department(stomach_pain, gastroenterology).
needs_department(vomiting, gastroenterology).

needs_department(skin_rash, dermatology).
needs_department(itching, dermatology).

needs_department(chest_pain, cardiology).
needs_department(breathing_problem, cardiology).

% Rules

patient_department(Patient, Department) :-
    symptom(Patient, Symptom),
    needs_department(Symptom, Department).

patient_doctor(Patient, Doctor) :-
    patient_department(Patient, Department),
    specialist(Doctor, Department).

has_symptom(Patient, Symptom) :-
    symptom(Patient, Symptom).

doctor_for_symptom(Doctor, Symptom) :-
    needs_department(Symptom, Department),
    specialist(Doctor, Department).

has_two_symptoms(Patient, Symptom1, Symptom2) :-
    symptom(Patient, Symptom1),
    symptom(Patient, Symptom2),
    dif(Symptom1, Symptom2).

cardiac_case(Patient) :-
    symptom(Patient, chest_pain),
    symptom(Patient, breathing_problem).

general_medicine_patient(Patient) :-
    patient_department(Patient, general_medicine).

specialist_patient(Patient) :-
    patient_department(Patient, Department),
    dif(Department, general_medicine).

patient_symptoms(Patient, Symptom) :-
    symptom(Patient, Symptom).
