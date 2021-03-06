/* Commands to import all the tables from CSV to SAS */
/* Importing Case Information Table */

PROC IMPORT OUT= WORK.case_info
            DATAFILE= "C:\Users\somloaner\Desktop\case_info.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;


/* Importing Speech Rating Table */

PROC IMPORT OUT= WORK.speech
            DATAFILE= "C:\Users\somloaner\Desktop\speech.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Affect Rating Table */

PROC IMPORT OUT= WORK.affect
            DATAFILE= "C:\Users\somloaner\Desktop\affect.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Interruption Table */

PROC IMPORT OUT= WORK.interruption
            DATAFILE= "C:\Users\somloaner\Desktop\interruption.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Commands to transpose variables in rows to columns */
/* Transpose Affect Ratings */

data work.case_info1 (drop = is_deleted);
   set work.case_info;
   label case_id = Case ID;
   label case_name = Case Name;
   label template_id = Template ID;
   label site_id = Site ID;
   label ra_id = RA ID;
   label study_id = Study ID;
   label instrument_number = Instrument Number;
   label number_encounters = Number of Encounters;
   label media_type = Media Type;
   label recording_duration = Recording Duration;
   label reliability_code = Reliability Coding;
run;

proc sort data = work.affect;
   by case_id;
run;

proc transpose data = work.affect out = work.affect1
prefix = affect;
by case_id;
var value;
run;

PROC SQL;
create table WORK.affect3 as
Select
AFFECT1.case_id,
AFFECT1.affect1 as sp_affect1 label="Affect Ratings - Anger - SP",
AFFECT1.affect2 as sp_affect2 label="Affect Ratings - Engaged - SP",
AFFECT1.affect3 as sp_affect3 label="Affect Ratings - Friendly - SP",
AFFECT1.affect4 as sp_affect4 label="Affect Ratings - Anxious - SP",
AFFECT1.affect5 as sp_affect5 label="Affect Ratings - Sincere - SP",
AFFECT1.affect6 as sp_affect6 label="Affect Ratings - Animated - SP",
AFFECT1.affect7 as sp_affect7 label="Affect Ratings - Depressed - SP",
AFFECT1.affect8 as sp_affect8 label="Affect Ratings - Assertive - SP",
AFFECT1.affect9 as sp_affect9 label="Affect Ratings - Expressive - SP",
AFFECT1.affect10 as pcp_affect1 label="Affect Ratings - Anger - PCP",
AFFECT1.affect11 as pcp_affect2 label="Affect Ratings - Engaged - PCP",
AFFECT1.affect12 as pcp_affect3 label="Affect Ratings - Friendly - PCP",
AFFECT1.affect13 as pcp_affect4 label="Affect Ratings - Anxious - PCP",
AFFECT1.affect14 as pcp_affect5 label="Affect Ratings - Sincere - PCP",
AFFECT1.affect15 as pcp_affect6 label="Affect Ratings - Animated - PCP",
AFFECT1.affect16 as pcp_affect7 label="Affect Ratings - Depressed - PCP",
AFFECT1.affect17 as pcp_affect8 label="Affect Ratings - Assertive - PCP",
AFFECT1.affect18 as pcp_affect9 label="Affect Ratings - Expressive - PCP",
AFFECT1.affect19 as pcp_affect10 label="Affect Ratings - Control Interaction - PCP",
AFFECT1.affect20 as pcp_affect11 label="Affect Ratings - Work Oriented - PCP",
AFFECT1.affect22 as pcp_affect12 label="Affect Ratings - Listen Patient - PCP",
AFFECT1.affect21 as pcp_affect13 label="Affect Ratings - Cooperate Patient - PCP",
AFFECT1.affect23 as pcp_affect14 label="Affect Ratings - Considered Patient - PCP",
AFFECT1.affect24 as pcp_affect15 label="Affect Ratings - Was Sincere - PCP",
AFFECT1.affect25 as pcp_affect16 label="Affect Ratings - Persuade Patient - PCP",
AFFECT1.affect26 as pcp_affect17 label="Affect Ratings - Patient Trust - PCP",
AFFECT1.affect27 as pcp_affect18 label="Affect Ratings - Relaxed Patient - PCP",
AFFECT1.affect28 as pcp_affect19 label="Affect Ratings - Approval Patient - PCP",
AFFECT1.affect29 as pcp_affect20 label="Affect Ratings - Calm Patient - PCP",
AFFECT1.affect30 as pcp_affect21 label="Affect Ratings - Honest Communication - PCP",
AFFECT1.affect31 as pcp_affect22 label="Affect Ratings - Interest Patient - PCP",
AFFECT1.affect32 as pcp_affect23 label="Affect Ratings - Comfortable Interacting - PCP",
AFFECT1.affect33 as pcp_affect24 label="Affect Ratings - Present Option - PCP",
AFFECT1.affect34 as pcp_affect25 label="Affect Ratings - Understand Treatment - PCP",
AFFECT1.affect35 as pcp_affect26 label="Affect Ratings - Confusing Language - PCP",
AFFECT1.affect36 as pcp_affect27 label="Affect Ratings - Clarify Language - PCP",
AFFECT1.affect37 as pcp_affect28 label="Affect Ratings - Address Patient - PCP",
AFFECT1.affect38 as pcp_affect29 label="Affect Ratings - Pet Name - PCP",
AFFECT1.affect39 as pcp_affect30 label="Affect Ratings - Treatment Option - PCP",
AFFECT1.affect40 as pcp_affect31 label="Affect Ratings - Clinical Trial - PCP",
AFFECT1.affect41 as pcp_affect32 label="Affect Ratings - Translator - PCP"
from WORK.AFFECT1;

/* End of Transpose */

/* Transpose Speech Ratings */

proc sort data = work.speech;
   by case_id;
run;

proc transpose data = work.speech out = work.speech1
   prefix = speech;
   by case_id;
   var value;
run;

/* End of Transpose */

PROC SQL;
create table WORK.speech2 as
Select
SPEECH1.case_id,
SPEECH1.speech1 as sp_speech1 label="Speech Ratings - Monotone - SP",
SPEECH1.speech2 as sp_speech2 label="Speech Ratings - Rate of Speech - SP",
SPEECH1.speech3 as sp_speech3 label="Speech Ratings - Sound Scripted - SP",
SPEECH1.speech4 as sp_speech4 label="Speech Ratings - Speaks Clearly - SP",
SPEECH1.speech5 as sp_speech5 label="Speech Ratings - Control of Conversation - SP",
SPEECH1.speech6 as sp_speech6 label="Speech Ratings - Hesitancy - SP",
SPEECH1.speech7 as sp_speech7 label="Speech Ratings - Use of Direct Communication - SP",
SPEECH1.speech8 as sp_speech8 label="Speech Ratings - Encourage Talk - SP",
SPEECH1.speech9 as sp_speech9 label="Speech Ratings - Use of Inclusive Pronouns - SP",
SPEECH1.speech10 as sp_speech10 label="Speech Ratings - Use of Fillers - SP",
SPEECH1.speech11 as sp_speech11 label="Speech Ratings - Response to Disease Info - SP",
SPEECH1.speech12 as sp_speech12 label="Speech Ratings - Response to Treatment - SP",
SPEECH1.speech13 as sp_speech13 label="Speech Ratings - Response to Side effect info - SP",
SPEECH1.speech14 as sp_speech14 label="Speech Ratings - Response to Prognostic Info - SP",
SPEECH1.speech15 as sp_speech15 label="Speech Ratings - Noise  - SP",
SPEECH1.speech16 as sp_speech16 label="Speech Ratings - Hearing Problem - SP",
SPEECH1.speech17 as sp_speech17 label="Speech Ratings - Crying - SP",
SPEECH1.speech18 as sp_speech18 label="Speech Ratings - Incongruence of accent - SP",
SPEECH1.speech19 as sp_speech19 label="Speech Ratings - Expresses gratitude - SP",
SPEECH1.speech20 as sp_speech20 label="Speech Ratings - Decision maker not patient - SP",
SPEECH1.speech21 as pcp_speech1 label="Speech Ratings - Monotone - PCP",
SPEECH1.speech22 as pcp_speech2 label="Speech Ratings - Control of Conversation - PCP",
SPEECH1.speech23 as pcp_speech3 label="Speech Ratings - Use of Inclusive pronouns - PCP",
SPEECH1.speech24 as pcp_speech4 label="Speech Ratings - Use of Fillers - PCP",
SPEECH1.speech25 as pcp_speech5 label="Speech Ratings - Hesitancy - PCP",
SPEECH1.speech26 as pcp_speech6 label="Speech Ratings - Rate of speech - PCP",
SPEECH1.speech27 as pcp_speech7 label="Speech Ratings - Use of Direct Communication - PCP",
SPEECH1.speech28 as pcp_speech8 label="Speech Ratings - Sound Scripted - PCP",
SPEECH1.speech29 as pcp_speech9 label="Speech Ratings - Speaks Clearly - PCP",
SPEECH1.speech30 as pcp_speech10 label="Speech Ratings - Encourage Talk - PCP",
SPEECH1.speech31 as pcp_speech11 label="Speech Ratings - Response to Disease info - PCP",
SPEECH1.speech32 as pcp_speech12 label="Speech Ratings - Response to Treatment - PCP",
SPEECH1.speech33 as pcp_speech13 label="Speech Ratings - Response to Side Effect Info - PCP",
SPEECH1.speech34 as pcp_speech14 label="Speech Ratings - Response to Prognostic Info - PCP",
SPEECH1.speech35 as pcp_speech15 label="Speech Ratings - Noise - PCP",
SPEECH1.speech36 as pcp_speech16 label="Speech Ratings - Hearing Problem - PCP",
SPEECH1.speech37 as pcp_speech17 label="Speech Ratings - Crying - PCP",
SPEECH1.speech38 as pcp_speech18 label="Speech Ratings - Incongruence of accent - PCP",
SPEECH1.speech39 as pcp_speech19 label="Speech Ratings - Expresses gratitude - PCP",
SPEECH1.speech40 as pcp_speech20 label="Speech Ratings - Decision maker not patient - PCP"
from WORK.SPEECH1
;

/* Transpose Interruption Counts */

proc sort data = work.interruption;
   by case_id;
run;

proc transpose data = work.interruption out = work.interruption1
   prefix = interruption;
   by case_id;
   var value;
run;

/* End of Transpose */

PROC SQL;
create table WORK.interruption2 as
Select
interruption1.case_id,
interruption1.interruption1 as sp_interruption1 label="Use of personal examples - SP",
interruption1.interruption2 as sp_interruption2 label="Stop interruption - SP",
interruption1.interruption3 as sp_interruption3 label="Cut off interruption - SP",
interruption1.interruption4 as sp_interruption4 label="Unanswered questions - SP",
interruption1.interruption5 as sp_interruption5 label="Self disclosure - SP",
interruption1.interruption1 as pcp_interruption1 label="Use of personal examples - PCP",
interruption1.interruption2 as pcp_interruption2 label="Stop interruption - PCP",
interruption1.interruption3 as pcp_interruption3 label="Cut off interruption - PCP",
interruption1.interruption4 as pcp_interruption4 label="Unanswered questions - PCP",
interruption1.interruption5 as pcp_interruption5 label="Self disclosure - PCP"
from WORK.interruption1;

/* Merge of CASEINFO, SPEECH RATING, INTERRUPTION, AFFECT RATING TABLES */

data work.sccap;
   merge work.case_info1 work.speech2 work.affect3 work.interruption2;
   by case_id;
run;

/* End of Merge */

/* Commands to import all the Content tables from Excel to SAS */

/* Importing Content Table */

PROC IMPORT OUT= WORK.content
            DATAFILE= "C:\Users\somloaner\Desktop\content.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Participant Table */

PROC IMPORT OUT= WORK.participant
            DATAFILE= "C:\Users\somloaner\Desktop\participant.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Communication Table */

PROC IMPORT OUT= WORK.communication
            DATAFILE= "C:\Users\somloaner\Desktop\communication.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Counts Table */

PROC IMPORT OUT= WORK.counts
            DATAFILE= "C:\Users\somloaner\Desktop\counts.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Template Table */

PROC IMPORT OUT= WORK.template_code
            DATAFILE= "C:\Users\somloaner\Desktop\template_code.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Template Table */

PROC IMPORT OUT= WORK.template_topic
            DATAFILE= "C:\Users\somloaner\Desktop\template_topic.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Decision Table */

PROC IMPORT OUT= WORK.decision
            DATAFILE= "C:\Users\somloaner\Desktop\decision.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/* Importing Decision Table */

PROC IMPORT OUT= WORK.decision_desc
            DATAFILE= "C:\Users\somloaner\Desktop\decision_desc.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;


/* Match Merge variables from CONTENT and TEMPLATE tables to match and describe all the topics with the topic_id variable */

data work.content1 (rename = (topic_id = template_code_id));
   set work.content;
   label topic_id = template_code_id;
run;

proc sort data = work.template_topic;
   by template_topic_id;
run;

proc sort data = work.template_code;
   by template_topic_id;
run;

data work.template1;
   merge work.template_topic work.template_code;
   by template_topic_id;
run;

proc sort data = work.content1;
   by template_code_id;
run;

proc sort data = work.template1;
   by template_code_id;
run;

data work.content2;
   merge work.content1 work.template1;
   by template_code_id;
run;

data work.content3;
   set work.content2;
   if content_id ^= .;
run;

data work.content4;
   set work.content3;
run;

proc sort data = work.content4;
   by content_id case_id;
run;

proc sort data = work.content4;
   by case_id;
run;

data work.content5 (rename= (topic_description = topic code_description = subtopic) drop = template_topic_id template_code_id is_deleted topic_order
code_order);
   set work.content4;
   label topic_description = topic;
   label code_description = subtopic;
run;

data work.participant1 (rename = (participant_id = speaker_id));
   set work.participant;
   label participant_id = speaker_id;
run;

proc sort data = work.content5;
   by speaker_id;
run;

proc sort data = work.participant1;
   by speaker_id;
run;

data work.content6;
   merge work.content5 work.participant1;
   by speaker_id;
run;

data work.content7 (rename = (participant_description = speaker_desc participant_type = speaker_type participant_opt_desc = speaker_opt_desc) drop = is_deleted);
   set work.content6;
   label participant_description = speaker_desc;
   label participant_type = speaker_type;
   label participant_opt_desc = speaker_opt_desc;
   if content_id ^= .;
run;

proc sort data = work.content7;
   by content_order;
run;

data work.content9;
   set work.content7;
   if topic = 'Introduction' and speaker_type = 'HCP' THEN pcp_int = 1;
   if topic = 'Introduction' and speaker_type = 'PT' THEN sp_int = 1;
   if topic = 'Medical History' and speaker_type = 'HCP' THEN pcp_medhist = 1;
   if topic = 'Medical History' and speaker_type = 'PT' THEN sp_medhist = 1;
   if topic = 'GI Medical History' and speaker_type = 'HCP' THEN pcp_gimedhist = 1;
   if topic = 'GI Medical History' and speaker_type = 'PT' THEN sp_gimedhist = 1;
   if topic = 'Family Medical History' and speaker_type = 'HCP' THEN pcp_fammedhist = 1;
   if topic = 'Family Medical History' and speaker_type = 'PT' THEN sp_fammedhist = 1;
   if topic = 'Health Behaviors' and speaker_type = 'HCP' THEN pcp_hlthbeh = 1;
   if topic = 'Health Behaviors' and speaker_type = 'PT' THEN sp_hlthbeh = 1;
   if topic = 'Psychosocial Information' and speaker_type = 'HCP' THEN pcp_psychinfo = 1;
   if topic = 'Psychosocial Information' and speaker_type = 'PT' THEN sp_psychinfo = 1;
   if topic = 'Physical Exam' and speaker_type = 'HCP' THEN pcp_physexam = 1;
   if topic = 'Physical Exam' and speaker_type = 'PT' THEN sp_physexam = 1;
   if topic = 'Symptoms' and speaker_type = 'HCP' THEN pcp_sympt = 1;
   if topic = 'Symptoms' and speaker_type = 'PT' THEN sp_sympt = 1;
   if topic = 'Orients Patient' and speaker_type = 'HCP' THEN pcp_oript = 1;
   if topic = 'Orients Patient' and speaker_type = 'PT' THEN sp_oript = 1;
   if topic = 'Financial' and speaker_type = 'HCP' THEN pcp_fin = 1;
   if topic = 'Financial' and speaker_type = 'PT' THEN sp_fin = 1;
   if topic = 'Possible Diagnoses' and speaker_type = 'HCP' THEN pcp_possdiag = 1;
   if topic = 'Possible Diagnoses' and speaker_type = 'PT' THEN sp_possdiag = 1;
   if topic = 'Referrals' and speaker_type = 'HCP' THEN pcp_ref = 1;
   if topic = 'Referrals' and speaker_type = 'PT' THEN sp_ref = 1;
   if topic = 'Tests Offered' and speaker_type = 'HCP' THEN pcp_tests = 1;
   if topic = 'Tests Offered' and speaker_type = 'PT' THEN sp_tests = 1;
   if topic = 'Medication' and speaker_type = 'HCP' THEN pcp_med = 1;
   if topic = 'Medication' and speaker_type = 'PT' THEN sp_med = 1;
   if topic = 'Other Treatments' and speaker_type = 'HCP' THEN pcp_othertx = 1;
   if topic = 'Other Treatments' and speaker_type = 'PT' THEN sp_othertx = 1;
   if topic = 'Emotions' and speaker_type = 'HCP' THEN pcp_emot = 1;
   if topic = 'Emotions' and speaker_type = 'PT' THEN sp_emot = 1;
   if topic = 'Social Chitchat' and speaker_type = 'HCP' THEN pcp_social = 1;
   if topic = 'Social Chitchat' and speaker_type = 'PT' THEN sp_social = 1;
   if topic = 'Follow up and Closing' and speaker_type = 'HCP' THEN pcp_closing = 1;
   if topic = 'Follow up and Closing' and speaker_type = 'PT' THEN sp_closing = 1;
   if topic = 'Unintelligible' and speaker_type = 'HCP' THEN pcp_unint = 1;
   if topic = 'Unintelligible' and speaker_type = 'PT' THEN sp_unint = 1;
   if topic = 'Back Channels/Fillers' and speaker_type = 'HCP' THEN pcp_bckch = 1;
   if topic = 'Back Channels/Fillers' and speaker_type = 'PT' THEN sp_bckch = 1;

   if subtopic = 'Name' and speaker_type = 'HCP' THEN pcp_int_sub1 = 1;
   if subtopic = 'Name' and speaker_type = 'PT' THEN sp_int_sub1 = 1;
   if subtopic = 'General greeting' and speaker_type = 'HCP' THEN pcp_int_sub2 = 1;
   if subtopic = 'General greeting' and speaker_type = 'PT' THEN sp_int_sub2 = 1;
   if subtopic = 'New patient' and speaker_type = 'HCP' THEN pcp_int_sub3 = 1;
   if subtopic = 'New patient' and speaker_type = 'PT' THEN sp_int_sub3 = 1;
   if subtopic = 'Can I help you' and speaker_type = 'HCP' THEN pcp_int_sub4 = 1;
   if subtopic = 'Can I help you' and speaker_type = 'PT' THEN sp_int_sub4 = 1;
   if subtopic = 'Reason for visit' and speaker_type = 'HCP' THEN pcp_int_sub5 = 1;
   if subtopic = 'Reason for visit' and speaker_type = 'PT' THEN sp_int_sub5 = 1;
   if topic = 'Introduction' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_int_sub6 = 1;
   if topic = 'Introduction' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_int_sub6 = 1;

   if subtopic = 'Doctors other (non-PCP) ' and speaker_type = 'HCP' THEN pcp_medhist_sub1 = 1;
   if subtopic = 'Doctors other (non-PCP)' and speaker_type = 'PT' THEN sp_medhist_sub1 = 1;
   if subtopic = 'Who prescribed medication' and speaker_type = 'HCP' THEN pcp_medhist_sub2 = 1;
   if subtopic = 'Who prescribed medication' and speaker_type = 'PT' THEN sp_medhist_sub2 = 1;
   if subtopic = 'Last time blood work was done' and speaker_type = 'HCP' THEN pcp_medhist_sub3 = 1;
   if subtopic = 'Last time blood work was done' and speaker_type = 'PT' THEN sp_medhist_sub3 = 1;
   if subtopic = 'Previous PCP' and speaker_type = 'HCP' THEN pcp_medhist_sub4 = 1;
   if subtopic = 'Previous PCP' and speaker_type = 'PT' THEN sp_medhist_sub4 = 1;
   if subtopic = 'Prescription medication, not GI' and speaker_type = 'HCP' THEN pcp_medhist_sub5 = 1;
   if subtopic = 'Prescription medication, not GI' and speaker_type = 'PT' THEN sp_medhist_sub5 = 1;
   if subtopic = 'OTC medication, not GI' and speaker_type = 'HCP' THEN pcp_medhist_sub6 = 1;
   if subtopic = 'OTC medication, not GI' and speaker_type = 'PT' THEN sp_medhist_sub6 = 1;
   if subtopic = 'Special medical conditions/ailments' and speaker_type = 'HCP' THEN pcp_medhist_sub7 = 1;
   if subtopic = 'Special medical conditions/ailments' and speaker_type = 'PT' THEN sp_medhist_sub7 = 1;
   if subtopic = 'Pain problems: other' and speaker_type = 'HCP' THEN pcp_medhist_sub8 = 1;
   if subtopic = 'Pain problems: other' and speaker_type = 'PT' THEN sp_medhist_sub8 = 1;
   if subtopic = 'Surgeries' and speaker_type = 'HCP' THEN pcp_medhist_sub9 = 1;
   if subtopic = 'Surgeries' and speaker_type = 'PT' THEN sp_medhist_sub9 = 1;
   if subtopic = 'Past hospitalizations' and speaker_type = 'HCP' THEN pcp_medhist_sub10 = 1;
   if subtopic = 'Past hospitalizations' and speaker_type = 'PT' THEN sp_medhist_sub10 = 1;
   if subtopic = 'Cancer screenings, not GI' and speaker_type = 'HCP' THEN pcp_medhist_sub11 = 1;
   if subtopic = 'Cancer screenings, not GI' and speaker_type = 'PT' THEN sp_medhist_sub11 = 1;
   if subtopic = 'Screenings: not cancer, not GI' and speaker_type = 'HCP' THEN pcp_medhist_sub12 = 1;
   if subtopic = 'Screenings: not cancer, not GI' and speaker_type = 'PT' THEN sp_medhist_sub12 = 1;
   if subtopic = 'Pregnancies' and speaker_type = 'HCP' THEN pcp_medhist_sub13 = 1;
   if subtopic = 'Pregnancies' and speaker_type = 'PT' THEN sp_medhist_sub13 = 1;
   if subtopic = 'GYN issues' and speaker_type = 'HCP' THEN pcp_medhist_sub14 = 1;
   if subtopic = 'GYN issues' and speaker_type = 'PT' THEN sp_medhist_sub14 = 1;
   if subtopic = 'General: Nonspecific' and speaker_type = 'HCP' THEN pcp_medhist_sub15 = 1;
   if subtopic = 'General: Nonspecific' and speaker_type = 'PT' THEN sp_medhist_sub15 = 1;
   if topic = 'Medical History' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_medhist_sub16 = 1;
   if topic = 'Medical History' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_medhist_sub16 = 1;

   if subtopic = 'IBS: Discusses pt experiences and hx' and speaker_type = 'HCP' THEN pcp_gimed_sub1 = 1;
   if subtopic = 'IBS: Discusses pt experiences and hx' and speaker_type = 'PT' THEN sp_gimed_sub1 = 1;
   if subtopic = 'When diagnoses with IBS' and speaker_type = 'HCP' THEN pcp_gimed_sub2 = 1;
   if subtopic = 'When diagnoses with IBS' and speaker_type = 'PT' THEN sp_gimed_sub2 = 1;
   if subtopic = 'Treatments/Medication for IBS' and speaker_type = 'HCP' THEN pcp_gimed_sub3 = 1;
   if subtopic = 'Treatments/Medication for IBS' and speaker_type = 'PT' THEN sp_gimed_sub3 = 1;
   if subtopic = 'Colonoscopy screening' and speaker_type = 'HCP' THEN pcp_gimed_sub4 = 1;
   if subtopic = 'Colonoscopy screening' and speaker_type = 'PT' THEN sp_gimed_sub4 = 1;
   if subtopic = 'Screenings: GI other' and speaker_type = 'HCP' THEN pcp_gimed_sub5 = 1;
   if subtopic = 'Screenings: GI other' and speaker_type = 'PT' THEN sp_gimed_sub5 = 1;
   if subtopic = 'Past other GI symptoms and illnesses' and speaker_type = 'HCP' THEN pcp_gimed_sub6 = 1;
   if subtopic = 'Past other GI symptoms and illnesses' and speaker_type = 'PT' THEN sp_gimed_sub6 = 1;
   if subtopic = 'General GI habits' and speaker_type = 'HCP' THEN pcp_gimed_sub7 = 1;
   if subtopic = 'General GI habits' and speaker_type = 'PT' THEN sp_gimed_sub7 = 1;
   if subtopic = 'Current other GI problems' and speaker_type = 'HCP' THEN pcp_gimed_sub8 = 1;
   if subtopic = 'Current other GI problems' and speaker_type = 'PT' THEN sp_gimed_sub8 = 1;
   if subtopic = 'Medication for other GI problems' and speaker_type = 'HCP' THEN pcp_gimed_sub9 = 1;
   if subtopic = 'Medication for other GI problems' and speaker_type = 'PT' THEN sp_gimed_sub9 = 1;
   if topic = 'GI Medical History' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_gimed_sub10 = 1;
   if topic = 'GI Medical History' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_gimed_sub10 = 1;

   if subtopic = 'General family medical history' and speaker_type = 'HCP' THEN pcp_fammed_sub1 = 1;
   if subtopic = 'General family medical history' and speaker_type = 'PT' THEN sp_fammed_sub1 = 1;
   if subtopic = 'Cancer family medical history' and speaker_type = 'HCP' THEN pcp_fammed_sub2 = 1;
   if subtopic = 'Cancer family medical history' and speaker_type = 'PT' THEN sp_fammed_sub2 = 1;
   if subtopic = 'GI problems family medical history' and speaker_type = 'HCP' THEN pcp_fammed_sub3 = 1;
   if subtopic = 'GI problems family medical history' and speaker_type = 'PT' THEN sp_fammed_sub3 = 1;
   if topic = 'Family Medical History' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_fammed_sub4 = 1;
   if topic = 'Family Medical History' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_fammed_sub4 = 1;

   if subtopic = 'Sleep' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub1 = 1;
   if subtopic = 'Sleep' and speaker_type = 'PT' THEN sp_hlthbeh_sub1 = 1;
   if subtopic = 'Tobacco Use' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub2 = 1;
   if subtopic = 'Tobacco Use' and speaker_type = 'PT' THEN sp_hlthbeh_sub2 = 1;
   if subtopic = 'Alcohol use' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub3 = 1;
   if subtopic = 'Alcohol use' and speaker_type = 'PT' THEN sp_hlthbeh_sub3 = 1;
   if subtopic = 'Caffeine intake' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub4 = 1;
   if subtopic = 'Caffeine intake' and speaker_type = 'PT' THEN sp_hlthbeh_sub4 = 1;
   if subtopic = 'Drug use' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub5 = 1;
   if subtopic = 'Drug use' and speaker_type = 'PT' THEN sp_hlthbeh_sub5 = 1;
   if subtopic = 'Diet' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub6 = 1;
   if subtopic = 'Diet' and speaker_type = 'PT' THEN sp_hlthbeh_sub6 = 1;
   if subtopic = 'Exercise' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub7 = 1;
   if subtopic = 'Exercise' and speaker_type = 'PT' THEN sp_hlthbeh_sub7 = 1;
   if topic = 'Health Behaviors' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_hlthbeh_sub8 = 1;
   if topic = 'Health Behaviors' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_hlthbeh_sub8 = 1;

   if subtopic = 'Age' and speaker_type = 'HCP' THEN pcp_psychinfo_sub1 = 1;
   if subtopic = 'Age' and speaker_type = 'PT' THEN sp_psychinfo_sub1 = 1;
   if subtopic = 'Education' and speaker_type = 'HCP' THEN pcp_psychinfo_sub2 = 1;
   if subtopic = 'Education' and speaker_type = 'PT' THEN sp_psychinfo_sub2 = 1;
   if subtopic = 'Stress' and speaker_type = 'HCP' THEN pcp_psychinfo_sub3 = 1;
   if subtopic = 'Stress' and speaker_type = 'PT' THEN sp_psychinfo_sub3 = 1;
   if subtopic = 'Recent move (all aspects)' and speaker_type = 'HCP' THEN pcp_psychinfo_sub4 = 1;
   if subtopic = 'Recent move (all aspects)' and speaker_type = 'PT' THEN sp_psychinfo_sub4 = 1;
   if subtopic = 'Living arrangements' and speaker_type = 'HCP' THEN pcp_psychinfo_sub5 = 1;
   if subtopic = 'Living arrangements' and speaker_type = 'PT' THEN sp_psychinfo_sub5 = 1;
   if subtopic = 'Environmental conditions' and speaker_type = 'HCP' THEN pcp_psychinfo_sub6 = 1;
   if subtopic = 'Environmental conditions' and speaker_type = 'PT' THEN sp_psychinfo_sub6 = 1;
   if subtopic = 'Occupational/work related issues' and speaker_type = 'HCP' THEN pcp_psychinfo_sub7 = 1;
   if subtopic = 'Occupational/work related issues' and speaker_type = 'PT' THEN sp_psychinfo_sub7 = 1;
   if subtopic = 'Marital status' and speaker_type = 'HCP' THEN pcp_psychinfo_sub8 = 1;
   if subtopic = 'Marital status' and speaker_type = 'PT' THEN sp_psychinfo_sub8 = 1;
   if subtopic = 'Children' and speaker_type = 'HCP' THEN pcp_psychinfo_sub9 = 1;
   if subtopic = 'Children' and speaker_type = 'PT' THEN sp_psychinfo_sub9 = 1;
   if subtopic = 'Sexual activity' and speaker_type = 'HCP' THEN pcp_psychinfo_sub10 = 1;
   if subtopic = 'Sexual activity' and speaker_type = 'PT' THEN sp_psychinfo_sub10 = 1;
   if subtopic = 'Significant others' and speaker_type = 'HCP' THEN pcp_psychinfo_sub11 = 1;
   if subtopic = 'Significant others' and speaker_type = 'PT' THEN sp_psychinfo_sub11 = 1;
   if subtopic = 'Quality of family/friend relationships' and speaker_type = 'HCP' THEN pcp_psychinfo_sub12 = 1;
   if subtopic = 'Quality of family/friend relationships' and speaker_type = 'PT' THEN sp_psychinfo_sub12 = 1;
   if subtopic = 'Mental health' and speaker_type = 'HCP' THEN pcp_psychinfo_sub13 = 1;
   if subtopic = 'Mental health' and speaker_type = 'PT' THEN sp_psychinfo_sub13 = 1;
   if subtopic = 'Recent travel' and speaker_type = 'HCP' THEN pcp_psychinfo_sub14 = 1;
   if subtopic = 'Recent travel' and speaker_type = 'PT' THEN sp_psychinfo_sub14 = 1;
   if topic = 'Psychosocial Information' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_psychinfo_sub15 = 1;
   if topic = 'Psychosocial Information' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_psychinfo_sub15 = 1;

   if subtopic = 'Gives patient instructions for exam' and speaker_type = 'HCP' THEN pcp_physexam_sub1 = 1;
   if subtopic = 'Gives patient instructions for exam' and speaker_type = 'PT' THEN sp_physexam_sub1 = 1;
   if subtopic = 'Checks vitals' and speaker_type = 'HCP' THEN pcp_physexam_sub2 = 1;
   if subtopic = 'Checks vitals' and speaker_type = 'PT' THEN sp_physexam_sub2 = 1;
   if subtopic = 'Examines non-GI systems' and speaker_type = 'HCP' THEN pcp_physexam_sub3 = 1;
   if subtopic = 'Examines non-GI systems' and speaker_type = 'PT' THEN sp_physexam_sub3 = 1;
   if subtopic = 'Palpates stomach' and speaker_type = 'HCP' THEN pcp_physexam_sub4 = 1;
   if subtopic = 'Palpates stomach' and speaker_type = 'PT' THEN sp_physexam_sub4 = 1;
   if subtopic = 'Rectal exam' and speaker_type = 'HCP' THEN pcp_physexam_sub5 = 1;
   if subtopic = 'Rectal exam' and speaker_type = 'PT' THEN sp_physexam_sub5 = 1;
   if subtopic = 'Hernia exam' and speaker_type = 'HCP' THEN pcp_physexam_sub6 = 1;
   if subtopic = 'Hernia exam' and speaker_type = 'PT' THEN sp_physexam_sub6 = 1;
   if subtopic = 'Prostate exam' and speaker_type = 'HCP' THEN pcp_physexam_sub7 = 1;
   if subtopic = 'Prostate exam' and speaker_type = 'PT' THEN sp_physexam_sub7 = 1;
   if subtopic = 'Pelvic exam' and speaker_type = 'HCP' THEN pcp_physexam_sub8 = 1;
   if subtopic = 'Pelvic exam' and speaker_type = 'PT' THEN sp_physexam_sub8 = 1;
   if subtopic = 'Breast exam' and speaker_type = 'HCP' THEN pcp_physexam_sub9 = 1;
   if subtopic = 'Breast exam' and speaker_type = 'PT' THEN sp_physexam_sub9 = 1;
   if subtopic = 'Discusses whether to have exam' and speaker_type = 'HCP' THEN pcp_physexam_sub10 = 1;
   if subtopic = 'Discusses whether to have exam' and speaker_type = 'PT' THEN sp_physexam_sub10 = 1;
   if subtopic = 'Explains or justifies reason for exam' and speaker_type = 'HCP' THEN pcp_physexam_sub11 = 1;
   if subtopic = 'Explains or justifies reason for exam' and speaker_type = 'PT' THEN sp_physexam_sub11 = 1;
   if subtopic = 'Ask permission for exam' and speaker_type = 'HCP' THEN pcp_physexam_sub12 = 1;
   if subtopic = 'Ask permission for exam' and speaker_type = 'PT' THEN sp_physexam_sub12 = 1;
   if subtopic = 'Physical observations' and speaker_type = 'HCP' THEN pcp_physexam_sub13 = 1;
   if subtopic = 'Physical observations' and speaker_type = 'PT' THEN sp_physexam_sub13 = 1;
   if subtopic = 'GI exam: other' and speaker_type = 'HCP' THEN pcp_physexam_sub14 = 1;
   if subtopic = 'GI exam: other' and speaker_type = 'PT' THEN sp_physexam_sub14 = 1;
   if topic = 'Physical Exam' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_physexam_sub15 = 1;
   if topic = 'Physical Exam' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_physexam_sub15 = 1;

   if subtopic = 'Duration of symptoms' and speaker_type = 'HCP' THEN pcp_sympt_sub1 = 1;
   if subtopic = 'Duration of symptoms' and speaker_type = 'PT' THEN sp_sympt_sub1 = 1;
   if subtopic = 'Periodicity of pain' and speaker_type = 'HCP' THEN pcp_sympt_sub2 = 1;
   if subtopic = 'Periodicity of pain' and speaker_type = 'PT' THEN sp_sympt_sub2 = 1;
   if subtopic = 'Symptom periodicity:other (non-pain)' and speaker_type = 'HCP' THEN pcp_sympt_sub3 = 1;
   if subtopic = 'Symptom periodicity:other (non-pain)' and speaker_type = 'PT' THEN sp_sympt_sub3 = 1;
   if subtopic = 'Description of pain' and speaker_type = 'HCP' THEN pcp_sympt_sub4 = 1;
   if subtopic = 'Description of pain' and speaker_type = 'PT' THEN sp_sympt_sub4 = 1;
   if subtopic = 'Pain rating' and speaker_type = 'HCP' THEN pcp_sympt_sub5 = 1;
   if subtopic = 'Pain rating' and speaker_type = 'PT' THEN sp_sympt_sub5 = 1;
   if subtopic = 'Location of pain' and speaker_type = 'HCP' THEN pcp_sympt_sub6 = 1;
   if subtopic = 'Location of pain' and speaker_type = 'PT' THEN sp_sympt_sub6 = 1;
   if subtopic = 'What makes pain worse/better' and speaker_type = 'HCP' THEN pcp_sympt_sub7 = 1;
   if subtopic = 'What makes pain worse/better' and speaker_type = 'PT' THEN sp_sympt_sub7 = 1;
   if subtopic = 'Fatigue' and speaker_type = 'HCP' THEN pcp_sympt_sub8 = 1;
   if subtopic = 'Fatigue' and speaker_type = 'PT' THEN sp_sympt_sub8 = 1;
   if subtopic = 'Constipation/Diarrhea' and speaker_type = 'HCP' THEN pcp_sympt_sub9 = 1;
   if subtopic = 'Constipation/Diarrhea' and speaker_type = 'PT' THEN sp_sympt_sub9 = 1;
   if subtopic = 'Stool changes (physical)' and speaker_type = 'HCP' THEN pcp_sympt_sub10 = 1;
   if subtopic = 'Stool changes (physical)' and speaker_type = 'PT' THEN sp_sympt_sub10 = 1;
   if subtopic = 'Changes in bowel habits (all but c/d)' and speaker_type = 'HCP' THEN pcp_sympt_sub11 = 1;
   if subtopic = 'Changes in bowel habits (all but c/d)' and speaker_type = 'PT' THEN sp_sympt_sub11 = 1;
   if subtopic = 'How eating affects symptoms' and speaker_type = 'HCP' THEN pcp_sympt_sub12 = 1;
   if subtopic = 'How eating affects symptoms' and speaker_type = 'PT' THEN sp_sympt_sub12 = 1;
   if subtopic = 'Certain foods effect on symptoms' and speaker_type = 'HCP' THEN pcp_sympt_sub13 = 1;
   if subtopic = 'Certain foods effect on symptoms' and speaker_type = 'PT' THEN sp_sympt_sub13 = 1;
   if subtopic = 'Symptoms after bowel movement' and speaker_type = 'HCP' THEN pcp_sympt_sub14 = 1;
   if subtopic = 'Symptoms after bowel movement' and speaker_type = 'PT' THEN sp_sympt_sub14 = 1;
   if subtopic = 'Appetite symptoms' and speaker_type = 'HCP' THEN pcp_sympt_sub15 = 1;
   if subtopic = 'Appetite symptoms' and speaker_type = 'PT' THEN sp_sympt_sub15 = 1;
   if subtopic = 'Diet changes made by patient' and speaker_type = 'HCP' THEN pcp_sympt_sub16 = 1;
   if subtopic = 'Diet changes made by patient' and speaker_type = 'PT' THEN sp_sympt_sub16 = 1;
   if subtopic = 'Weight loss or gain' and speaker_type = 'HCP' THEN pcp_sympt_sub17 = 1;
   if subtopic = 'Weight loss or gain' and speaker_type = 'PT' THEN sp_sympt_sub17 = 1;
   if subtopic = 'Effect of symptoms on daily routine' and speaker_type = 'HCP' THEN pcp_sympt_sub18 = 1;
   if subtopic = 'Effect of symptoms on daily routine' and speaker_type = 'PT' THEN sp_sympt_sub18 = 1;
   if subtopic = 'IBS problems' and speaker_type = 'HCP' THEN pcp_sympt_sub19 = 1;
   if subtopic = 'IBS problems' and speaker_type = 'PT' THEN sp_sympt_sub19 = 1;
   if subtopic = 'Nausea or vomiting' and speaker_type = 'HCP' THEN pcp_sympt_sub20 = 1;
   if subtopic = 'Nausea or vomiting' and speaker_type = 'PT' THEN sp_sympt_sub20 = 1;
   if subtopic = 'Fever and/or chills' and speaker_type = 'HCP' THEN pcp_sympt_sub21 = 1;
   if subtopic = 'Fever and/or chills' and speaker_type = 'PT' THEN sp_sympt_sub21 = 1;
   if subtopic = 'Blood in stool/rectal bleeding' and speaker_type = 'HCP' THEN pcp_sympt_sub22 = 1;
   if subtopic = 'Blood in stool/rectal bleeding' and speaker_type = 'PT' THEN sp_sympt_sub22 = 1;
   if subtopic = 'Heartburn' and speaker_type = 'HCP' THEN pcp_sympt_sub23 = 1;
   if subtopic = 'Heartburn' and speaker_type = 'PT' THEN sp_sympt_sub23 = 1;
   if subtopic = 'Bloating' and speaker_type = 'HCP' THEN pcp_sympt_sub24 = 1;
   if subtopic = 'Bloating' and speaker_type = 'PT' THEN sp_sympt_sub24 = 1;
   if subtopic = 'Urination changes/problems' and speaker_type = 'HCP' THEN pcp_sympt_sub25 = 1;
   if subtopic = 'Urination changes/problems' and speaker_type = 'PT' THEN sp_sympt_sub25 = 1;
   if topic = 'Symptoms' and subtopic = 'GYN issues' and speaker_type = 'HCP' THEN pcp_sympt_sub26 = 1;
   if topic = 'Symptoms' and subtopic = 'GYN issues' and speaker_type = 'PT' THEN sp_sympt_sub26 = 1;
   if subtopic = 'Online/educational materials' and speaker_type = 'HCP' THEN pcp_sympt_sub27 = 1;
   if subtopic = 'Online/educational materials' and speaker_type = 'PT' THEN sp_sympt_sub27 = 1;
   if subtopic = 'Effect of life changes on symptoms' and speaker_type = 'HCP' THEN pcp_sympt_sub28 = 1;
   if subtopic = 'Effect of life changes on symptoms' and speaker_type = 'PT' THEN sp_sympt_sub28 = 1;
   if subtopic = 'Symptoms are changing/different' and speaker_type = 'HCP' THEN pcp_sympt_sub29 = 1;
   if subtopic = 'Symptoms are changing/different' and speaker_type = 'PT' THEN sp_sympt_sub29 = 1;
   if subtopic = 'Mucous in stool' and speaker_type = 'HCP' THEN pcp_sympt_sub30 = 1;
   if subtopic = 'Mucous in stool' and speaker_type = 'PT' THEN sp_sympt_sub30 = 1;
   if topic = 'Symptoms' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_sympt_sub31 = 1;
   if topic = 'Symptoms' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_sympt_sub31 = 1;

   if subtopic = 'Discusses practice logistics' and speaker_type = 'HCP' THEN pcp_oript_sub1 = 1;
   if subtopic = 'Discusses practice logistics' and speaker_type = 'PT' THEN sp_oript_sub1 = 1;
   if subtopic = 'Medical charts/records' and speaker_type = 'HCP' THEN pcp_oript_sub2 = 1;
   if subtopic = 'Medical charts/records' and speaker_type = 'PT' THEN sp_oript_sub2 = 1;
   if subtopic = 'Billing' and speaker_type = 'HCP' THEN pcp_oript_sub3 = 1;
   if subtopic = 'Billing' and speaker_type = 'PT' THEN sp_oript_sub3 = 1;
   if subtopic = 'Prepping or info from nurse about doctor' and speaker_type = 'HCP' THEN pcp_oript_sub4 = 1;
   if subtopic = 'Prepping or info from nurse about doctor' and speaker_type = 'PT' THEN sp_oript_sub4 = 1;
   if subtopic = "Logistics of today's visit" and speaker_type = 'HCP' THEN pcp_oript_sub5 = 1;
   if subtopic = "Logistics of today's visit" and speaker_type = 'PT' THEN sp_oript_sub5 = 1;
   if subtopic = 'Educates Patient' and speaker_type = 'HCP' THEN pcp_oript_sub6 = 1;
   if subtopic = 'Educates Patient' and speaker_type = 'PT' THEN sp_oript_sub6 = 1;
   if topic = 'Orients Patient' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_oript_sub7 = 1;
   if topic = 'Orients Patient' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_oript_sub7 = 1;

   if subtopic = 'Does patient have health insurance' and speaker_type = 'HCP' THEN pcp_fin_sub1 = 1;
   if subtopic = 'Does patient have health insurance' and speaker_type = 'PT' THEN sp_fin_sub1 = 1;
   if subtopic = 'When health insurance starts' and speaker_type = 'HCP' THEN pcp_fin_sub2 = 1;
   if subtopic = 'When health insurance starts' and speaker_type = 'PT' THEN sp_fin_sub2 = 1;
   if subtopic = 'Health insurance: general' and speaker_type = 'HCP' THEN pcp_fin_sub3 = 1;
   if subtopic = 'Health insurance: general' and speaker_type = 'PT' THEN sp_fin_sub3 = 1;
   if subtopic = 'Wait for insurance to do tests' and speaker_type = 'HCP' THEN pcp_fin_sub4 = 1;
   if subtopic = 'Wait for insurance to do tests' and speaker_type = 'PT' THEN sp_fin_sub4 = 1;
   if subtopic = 'Medication costs' and speaker_type = 'HCP' THEN pcp_fin_sub5 = 1;
   if subtopic = 'Medication costs' and speaker_type = 'PT' THEN sp_fin_sub5 = 1;
   if subtopic = 'Alternatives to expensive medication' and speaker_type = 'HCP' THEN pcp_fin_sub6 = 1;
   if subtopic = 'Alternatives to expensive medication' and speaker_type = 'PT' THEN sp_fin_sub6 = 1;
   if subtopic = 'Test costs' and speaker_type = 'HCP' THEN pcp_fin_sub7 = 1;
   if subtopic = 'Test costs' and speaker_type = 'PT' THEN sp_fin_sub7 = 1;
   if subtopic = 'General financial issues' and speaker_type = 'HCP' THEN pcp_fin_sub8 = 1;
   if subtopic = 'General financial issues' and speaker_type = 'PT' THEN sp_fin_sub8 = 1;
   if topic = 'Financial' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_fin_sub9 = 1;
   if topic = 'Financial' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_fin_sub9 = 1;

   if subtopic = 'Cancer ruleout' and speaker_type = 'HCP' THEN pcp_possdiag_sub1 = 1;
   if subtopic = 'Cancer ruleout' and speaker_type = 'PT' THEN sp_possdiag_sub1 = 1;
   if subtopic = 'General ruleout' and speaker_type = 'HCP' THEN pcp_possdiag_sub2 = 1;
   if subtopic = 'General ruleout' and speaker_type = 'PT' THEN sp_possdiag_sub2 = 1;
   if subtopic = 'Physician states does not know' and speaker_type = 'HCP' THEN pcp_possdiag_sub3 = 1;
   if subtopic = 'Physician states does not know' and speaker_type = 'PT' THEN sp_possdiag_sub3 = 1;
   if subtopic = 'Online/education materials' and speaker_type = 'HCP' THEN pcp_possdiag_sub4 = 1;
   if subtopic = 'Online/education materials' and speaker_type = 'PT' THEN sp_possdiag_sub4 = 1;
   if subtopic = 'Self-diagnoses' and speaker_type = 'HCP' THEN pcp_possdiag_sub5 = 1;
   if subtopic = 'Self-diagnoses' and speaker_type = 'PT' THEN sp_possdiag_sub5 = 1;
   if subtopic = 'Colorectal Cancer' and speaker_type = 'HCP' THEN pcp_possdiag_sub6 = 1;
   if subtopic = 'Colorectal Cancer' and speaker_type = 'PT' THEN sp_possdiag_sub6 = 1;
   if subtopic = 'Unspecified Cancer' and speaker_type = 'HCP' THEN pcp_possdiag_sub7 = 1;
   if subtopic = 'Unspecified Cancer' and speaker_type = 'PT' THEN sp_possdiag_sub7 = 1;
   if subtopic = 'Cancer: other (non-colorectal)' and speaker_type = 'HCP' THEN pcp_possdiag_sub8 = 1;
   if subtopic = 'Cancer: other (non-colorectal)' and speaker_type = 'PT' THEN sp_possdiag_sub8 = 1;
   if subtopic = 'Gallbladder' and speaker_type = 'HCP' THEN pcp_possdiag_sub9 = 1;
   if subtopic = 'Gallbladder' and speaker_type = 'PT' THEN sp_possdiag_sub9 = 1;
   if subtopic = 'IBS' and speaker_type = 'HCP' THEN pcp_possdiag_sub10 = 1;
   if subtopic = 'IBS' and speaker_type = 'PT' THEN sp_possdiag_sub10 = 1;
   if subtopic = 'Ulcer/Gastritis/Hyperacidity' and speaker_type = 'HCP' THEN pcp_possdiag_sub11 = 1;
   if subtopic = 'Ulcer/Gastritis/Hyperacidity' and speaker_type = 'PT' THEN sp_possdiag_sub11 = 1;
   if subtopic = 'Duadenitis' and speaker_type = 'HCP' THEN pcp_possdiag_sub12 = 1;
   if subtopic = 'Duadenitis' and speaker_type = 'PT' THEN sp_possdiag_sub12 = 1;
   if subtopic = 'Colitis' and speaker_type = 'HCP' THEN pcp_possdiag_sub13 = 1;
   if subtopic = 'Colitis' and speaker_type = 'PT' THEN sp_possdiag_sub13 = 1;
   if subtopic = "Crohn's Disease" and speaker_type = 'HCP' THEN pcp_possdiag_sub14 = 1;
   if subtopic = "Crohn's Disease" and speaker_type = 'PT' THEN sp_possdiag_sub14 = 1;
   if subtopic = 'Pancreas' and speaker_type = 'HCP' THEN pcp_possdiag_sub15 = 1;
   if subtopic = 'Pancreas' and speaker_type = 'PT' THEN sp_possdiag_sub15 = 1;
   if subtopic = 'Thyroid' and speaker_type = 'HCP' THEN pcp_possdiag_sub16 = 1;
   if subtopic = 'Thyroid' and speaker_type = 'PT' THEN sp_possdiag_sub16 = 1;
   if subtopic = 'Liver' and speaker_type = 'HCP' THEN pcp_possdiag_sub17 = 1;
   if subtopic = 'Liver' and speaker_type = 'PT' THEN sp_possdiag_sub17 = 1;
   if subtopic = 'Kidneys' and speaker_type = 'HCP' THEN pcp_possdiag_sub18 = 1;
   if subtopic = 'Kidneys' and speaker_type = 'PT' THEN sp_possdiag_sub18 = 1;
   if subtopic = 'Stomach' and speaker_type = 'HCP' THEN pcp_possdiag_sub19 = 1;
   if subtopic = 'Stomach' and speaker_type = 'PT' THEN sp_possdiag_sub19 = 1;
   if subtopic = 'Colon' and speaker_type = 'HCP' THEN pcp_possdiag_sub20 = 1;
   if subtopic = 'Colon' and speaker_type = 'PT' THEN sp_possdiag_sub20 = 1;
   if subtopic = 'Anemia' and speaker_type = 'HCP' THEN pcp_possdiag_sub21 = 1;
   if subtopic = 'Anemia' and speaker_type = 'PT' THEN sp_possdiag_sub21 = 1;
   if subtopic = 'Diverticulitis/Diverticulosis' and speaker_type = 'HCP' THEN pcp_possdiag_sub22 = 1;
   if subtopic = 'Diverticulitis/Diverticulosis' and speaker_type = 'PT' THEN sp_possdiag_sub22 = 1;
   if subtopic = 'Hemorrhoids' and speaker_type = 'HCP' THEN pcp_possdiag_sub23 = 1;
   if subtopic = 'Hemorrhoids' and speaker_type = 'PT' THEN sp_possdiag_sub23 = 1;
   if subtopic = 'Polyps' and speaker_type = 'HCP' THEN pcp_possdiag_sub24 = 1;
   if subtopic = 'Polyps' and speaker_type = 'PT' THEN sp_possdiag_sub24 = 1;
   if subtopic = 'Urinary infection' and speaker_type = 'HCP' THEN pcp_possdiag_sub25 = 1;
   if subtopic = 'Urinary infection' and speaker_type = 'PT' THEN sp_possdiag_sub25 = 1;
   if subtopic = 'Prostate' and speaker_type = 'HCP' THEN pcp_possdiag_sub26 = 1;
   if subtopic = 'Prostate' and speaker_type = 'PT' THEN sp_possdiag_sub26 = 1;
   if topic = 'Possible Diagnoses' and subtopic = 'GYN' and speaker_type = 'HCP' THEN pcp_possdiag_sub27 = 1;
   if topic = 'Possible Diagnoses' and subtopic = 'GYN' and speaker_type = 'PT' THEN sp_possdiag_sub27 = 1;
   if subtopic = 'Flu/virus/bacteria' and speaker_type = 'HCP' THEN pcp_possdiag_sub28 = 1;
   if subtopic = 'Flu/virus/bacteria' and speaker_type = 'PT' THEN sp_possdiag_sub28 = 1;
   if subtopic = 'Appendix' and speaker_type = 'HCP' THEN pcp_possdiag_sub29 = 1;
   if subtopic = 'Appendix' and speaker_type = 'PT' THEN sp_possdiag_sub29 = 1;
   if subtopic = 'Spleen' and speaker_type = 'HCP' THEN pcp_possdiag_sub30 = 1;
   if subtopic = 'Spleen' and speaker_type = 'PT' THEN sp_possdiag_sub30 = 1;
   if subtopic = 'Intestinal blockage' and speaker_type = 'HCP' THEN pcp_possdiag_sub31 = 1;
   if subtopic = 'Intestinal blockage' and speaker_type = 'PT' THEN sp_possdiag_sub31 = 1;
   if subtopic = 'Diet' and speaker_type = 'HCP' THEN pcp_possdiag_sub32 = 1;
   if subtopic = 'Diet' and speaker_type = 'PT' THEN sp_possdiag_sub32 = 1;
   if subtopic = 'Medication side effects' and speaker_type = 'HCP' THEN pcp_possdiag_sub33 = 1;
   if subtopic = 'Medication side effects' and speaker_type = 'PT' THEN sp_possdiag_sub33 = 1;
   if subtopic = 'Stress' and speaker_type = 'HCP' THEN pcp_possdiag_sub34 = 1;
   if subtopic = 'Stress' and speaker_type = 'PT' THEN sp_possdiag_sub34 = 1;
   if subtopic = 'Celiac Disease' and speaker_type = 'HCP' THEN pcp_possdiag_sub35 = 1;
   if subtopic = 'Celiac Disease' and speaker_type = 'PT' THEN sp_possdiag_sub35 = 1;
   if topic = 'Possible Diagnoses' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_possdiag_sub36 = 1;
   if topic = 'Possible Diagnoses' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_possdiag_sub36 = 1;

   if subtopic = 'GI specialist' and speaker_type = 'HCP' THEN pcp_ref_sub1 = 1;
   if subtopic = 'GI specialist' and speaker_type = 'PT' THEN sp_ref_sub1 = 1;
   if topic = 'Referrals' and subtopic = 'OB/GYN' and speaker_type = 'HCP' THEN pcp_ref_sub2 = 1;
   if topic = 'Referrals' and subtopic = 'OB/GYN' and speaker_type = 'PT' THEN sp_ref_sub2 = 1;
   if subtopic = 'Specialist other' and speaker_type = 'HCP' THEN pcp_ref_sub3 = 1;
   if subtopic = 'Specialist other' and speaker_type = 'PT' THEN sp_ref_sub3 = 1;
   if subtopic = 'PCP other' and speaker_type = 'HCP' THEN pcp_ref_sub4 = 1;
   if subtopic = 'PCP other' and speaker_type = 'PT' THEN sp_ref_sub4 = 1;
   if subtopic = 'Clinic or hospital' and speaker_type = 'HCP' THEN pcp_ref_sub5 = 1;
   if subtopic = 'Clinic or hospital' and speaker_type = 'PT' THEN sp_ref_sub5 = 1;
   if topic = 'Referrals' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_ref_sub6 = 1;
   if topic = 'Referrals' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_ref_sub6 = 1;

   if subtopic = 'Preparation for tests' and speaker_type = 'HCP' THEN pcp_tests_sub1 = 1;
   if subtopic = 'Preparation for tests' and speaker_type = 'PT' THEN sp_tests_sub1 = 1;
   if subtopic = 'Rationale for tests' and speaker_type = 'HCP' THEN pcp_tests_sub2 = 1;
   if subtopic = 'Rationale for tests' and speaker_type = 'PT' THEN sp_tests_sub2 = 1;
   if subtopic = 'Sequential diagnostic process discussion' and speaker_type = 'HCP' THEN pcp_tests_sub3 = 1;
   if subtopic = 'Sequential diagnostic process discussion' and speaker_type = 'PT' THEN sp_tests_sub3 = 1;
   if subtopic = 'Offers test options' and speaker_type = 'HCP' THEN pcp_tests_sub4 = 1;
   if subtopic = 'Offers test options' and speaker_type = 'PT' THEN sp_tests_sub4 = 1;
   if subtopic = 'Online/educational materials' and speaker_type = 'HCP' THEN pcp_tests_sub5 = 1;
   if subtopic = 'Online/educational materials' and speaker_type = 'PT' THEN sp_tests_sub5 = 1;
   if subtopic = 'Discusses whether to do tests today' and speaker_type = 'HCP' THEN pcp_tests_sub6 = 1;
   if subtopic = 'Discusses whether to do tests today' and speaker_type = 'PT' THEN sp_tests_sub6 = 1;
   if subtopic = 'Blood work' and speaker_type = 'HCP' THEN pcp_tests_sub7 = 1;
   if subtopic = 'Blood work' and speaker_type = 'PT' THEN sp_tests_sub7 = 1;
   if subtopic = 'CT Scan' and speaker_type = 'HCP' THEN pcp_tests_sub8 = 1;
   if subtopic = 'CT Scan' and speaker_type = 'PT' THEN sp_tests_sub8 = 1;
   if subtopic = 'MRI' and speaker_type = 'HCP' THEN pcp_tests_sub9 = 1;
   if subtopic = 'MRI' and speaker_type = 'PT' THEN sp_tests_sub9 = 1;
   if subtopic = 'Ultrasound' and speaker_type = 'HCP' THEN pcp_tests_sub10 = 1;
   if subtopic = 'Ultrasound' and speaker_type = 'PT' THEN sp_tests_sub10 = 1;
   if subtopic = 'X-ray' and speaker_type = 'HCP' THEN pcp_tests_sub11 = 1;
   if subtopic = 'X-ray' and speaker_type = 'PT' THEN sp_tests_sub11 = 1;
   if subtopic = 'Hemoccult/stool sample' and speaker_type = 'HCP' THEN pcp_tests_sub12 = 1;
   if subtopic = 'Hemoccult/stool sample' and speaker_type = 'PT' THEN sp_tests_sub12 = 1;
   if subtopic = 'FOBT (take-home test)' and speaker_type = 'HCP' THEN pcp_tests_sub13 = 1;
   if subtopic = 'FOBT (take-home test)' and speaker_type = 'PT' THEN sp_tests_sub13 = 1;
   if subtopic = 'Colonoscopy' and speaker_type = 'HCP' THEN pcp_tests_sub14 = 1;
   if subtopic = 'Colonoscopy' and speaker_type = 'PT' THEN sp_tests_sub14 = 1;
   if subtopic = 'Virtual colonoscopy' and speaker_type = 'HCP' THEN pcp_tests_sub15 = 1;
   if subtopic = 'Virtual  colonoscopy' and speaker_type = 'PT' THEN sp_tests_sub15 = 1;
   if subtopic = 'Endoscopy' and speaker_type = 'HCP' THEN pcp_tests_sub16 = 1;
   if subtopic = 'Endoscopy' and speaker_type = 'PT' THEN sp_tests_sub16 = 1;
   if subtopic = 'Urine test' and speaker_type = 'HCP' THEN pcp_tests_sub17 = 1;
   if subtopic = 'Urine test' and speaker_type = 'PT' THEN sp_tests_sub17 = 1;
   if subtopic = 'EKG' and speaker_type = 'HCP' THEN pcp_tests_sub18 = 1;
   if subtopic = 'EKG' and speaker_type = 'PT' THEN sp_tests_sub18 = 1;
   if topic = 'Tests Offered' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_tests_sub19 = 1;
   if topic = 'Tests Offered' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_tests_sub19 = 1;

   if subtopic = 'GI prescription offered' and speaker_type = 'HCP' THEN pcp_meds_sub1 = 1;
   if subtopic = 'GI prescription offered' and speaker_type = 'PT' THEN sp_meds_sub1 = 1;
   if subtopic = 'Non GI prescription offered' and speaker_type = 'HCP' THEN pcp_meds_sub2 = 1;
   if subtopic = 'Non GI prescription offered' and speaker_type = 'PT' THEN sp_meds_sub2 = 1;
   if subtopic = 'OTC GI offered' and speaker_type = 'HCP' THEN pcp_meds_sub3 = 1;
   if subtopic = 'OT GI offered' and speaker_type = 'PT' THEN sp_meds_sub3 = 1;
   if subtopic = 'Other OTC offered' and speaker_type = 'HCP' THEN pcp_meds_sub4 = 1;
   if subtopic = 'Other OTC offered' and speaker_type = 'PT' THEN sp_meds_sub4 = 1;
   if subtopic = 'Offers medication sample' and speaker_type = 'HCP' THEN pcp_meds_sub5 = 1;
   if subtopic = 'Offers medication sample' and speaker_type = 'PT' THEN sp_meds_sub5 = 1;
   if subtopic = 'Description of medication side effects' and speaker_type = 'HCP' THEN pcp_meds_sub6 = 1;
   if subtopic = 'Description of medication side effects' and speaker_type = 'PT' THEN sp_meds_sub6 = 1;
   if subtopic = 'Rationale for medication' and speaker_type = 'HCP' THEN pcp_meds_sub7 = 1;
   if subtopic = 'Rationale for medication' and speaker_type = 'PT' THEN sp_meds_sub7 = 1;
   if subtopic = 'Directions for taking medication' and speaker_type = 'HCP' THEN pcp_meds_sub8 = 1;
   if subtopic = 'Directions for taking medication' and speaker_type = 'PT' THEN sp_meds_sub8 = 1;
   if subtopic = 'How medication works' and speaker_type = 'HCP' THEN pcp_meds_sub9 = 1;
   if subtopic = 'How medication works' and speaker_type = 'PT' THEN sp_meds_sub9 = 1;
   if topic = 'Medication' and subtopic = 'Online/educational materials' and speaker_type = 'HCP' THEN pcp_meds_sub10 = 1;
   if topic = 'Medication' and subtopic = 'Online/educational materials' and speaker_type = 'PT' THEN sp_meds_sub10 = 1;
   if topic = 'Medication' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_meds_sub11 = 1;
   if topic = 'Medication' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_meds_sub11 = 1;

   if subtopic = 'Change diet' and speaker_type = 'HCP' THEN pcp_othertx_sub1 = 1;
   if subtopic = 'Change diet' and speaker_type = 'PT' THEN sp_othertx_sub1 = 1;
   if subtopic = 'Increase exercise' and speaker_type = 'HCP' THEN pcp_othertx_sub2 = 1;
   if subtopic = 'Increase exercise' and speaker_type = 'PT' THEN sp_othertx_sub2 = 1;
   if subtopic = 'Regulate or increase sleep' and speaker_type = 'HCP' THEN pcp_othertx_sub3 = 1;
   if subtopic = 'Regulate or increase sleep' and speaker_type = 'PT' THEN sp_othertx_sub3 = 1;
   if subtopic = 'Decrease stress' and speaker_type = 'HCP' THEN pcp_othertx_sub4 = 1;
   if subtopic = 'Decrease stress' and speaker_type = 'PT' THEN sp_othertx_sub4 = 1;
   if subtopic = 'Rationale for other treatments' and speaker_type = 'HCP' THEN pcp_othertx_sub5 = 1;
   if subtopic = 'Rationale for other treatments' and speaker_type = 'PT' THEN sp_othertx_sub5 = 1;
   if topic = 'Other Treatments' and subtopic = 'Online/educational materials' and speaker_type = 'HCP' THEN pcp_othertx_sub6 = 1;
   if topic = 'Other Treatments' and subtopic = 'Online/educational materials' and speaker_type = 'PT' THEN sp_othertx_sub6 = 1;
   if subtopic = 'Probiotics' and speaker_type = 'HCP' THEN pcp_othertx_sub7 = 1;
   if subtopic = 'Probiotics' and speaker_type = 'PT' THEN sp_othertx_sub7 = 1;
   if topic = 'Other Treatments' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_othertx_sub8 = 1;
   if topic = 'Other Treatments' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_othertx_sub8 = 1;

   if subtopic = 'Annoyed/frustrated about symptoms' and speaker_type = 'HCP' THEN pcp_emot_sub1 = 1;
   if subtopic = 'Annoyed/frustrated about symptoms' and speaker_type = 'PT' THEN sp_emot_sub1 = 1;
   if subtopic = 'Concerned/worried about symptoms' and speaker_type = 'HCP' THEN pcp_emot_sub2 = 1;
   if subtopic = 'Concerned/worried about symptoms' and speaker_type = 'PT' THEN sp_emot_sub2 = 1;
   if subtopic = 'General anxiety during visit' and speaker_type = 'HCP' THEN pcp_emot_sub3 = 1;
   if subtopic = 'General anxiety during visit' and speaker_type = 'PT' THEN sp_emot_sub3 = 1;
   if subtopic = 'Depression' and speaker_type = 'HCP' THEN pcp_emot_sub4 = 1;
   if subtopic = 'Depression' and speaker_type = 'PT' THEN sp_emot_sub4 = 1;
   if subtopic = 'Crying' and speaker_type = 'HCP' THEN pcp_emot_sub5 = 1;
   if subtopic = 'Crying' and speaker_type = 'PT' THEN sp_emot_sub5 = 1;
   if topic = 'Emotions' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_emot_sub6 = 1;
   if topic = 'Emotions' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_emot_sub6 = 1;

   if subtopic = 'Weather' and speaker_type = 'HCP' THEN pcp_social_sub1 = 1;
   if subtopic = 'Weather' and speaker_type = 'PT' THEN sp_social_sub1 = 1;
   if subtopic = 'Information about region' and speaker_type = 'HCP' THEN pcp_social_sub2 = 1;
   if subtopic = 'Information about region' and speaker_type = 'PT' THEN sp_social_sub2 = 1;
   if subtopic = 'Common interests' and speaker_type = 'HCP' THEN pcp_social_sub3 = 1;
   if subtopic = 'Common interests' and speaker_type = 'PT' THEN sp_social_sub3 = 1;
   if subtopic = 'Current events' and speaker_type = 'HCP' THEN pcp_social_sub4 = 1;
   if subtopic = 'Current events' and speaker_type = 'PT' THEN sp_social_sub4 = 1;
   if subtopic = 'Sports' and speaker_type = 'HCP' THEN pcp_social_sub5 = 1;
   if subtopic = 'Sports' and speaker_type = 'PT' THEN sp_social_sub5 = 1;
   if subtopic = 'Discusses previous city (Detroit/Pittsburg)' and speaker_type = 'HCP' THEN pcp_social_sub6 = 1;
   if subtopic = 'Discusses previous city (Detroit/Pittsburg)' and speaker_type = 'PT' THEN sp_social_sub6 = 1;
   if subtopic = 'Social niceties' and speaker_type = 'HCP' THEN pcp_social_sub7 = 1;
   if subtopic = 'Social niceties' and speaker_type = 'PT' THEN sp_social_sub7 = 1;
   if topic = 'Social Chitchat' and subtopic = 'Other' and speaker_type = 'HCP' THEN pcp_social_sub8 = 1;
   if topic = 'Social Chitchat' and subtopic = 'Other' and speaker_type = 'PT' THEN sp_social_sub8 = 1;

   if subtopic = 'Schedule follow-up visit' and speaker_type = 'HCP' THEN pcp_closing_sub1 = 1;
   if subtopic = 'Schedule follow-up visit' and speaker_type = 'PT' THEN sp_closing_sub1 = 1;
   if subtopic = 'Call in a few days/weeks' and speaker_type = 'HCP' THEN pcp_closing_sub2 = 1;
   if subtopic = 'Call in a few days/weeks' and speaker_type = 'PT' THEN sp_closing_sub2 = 1;
   if subtopic = 'No need to follow-up if improves' and speaker_type = 'HCP' THEN pcp_closing_sub3 = 1;
   if subtopic = 'No need to follow-up if improves' and speaker_type = 'PT' THEN sp_closing_sub3 = 1;
   if subtopic = 'Logistics for testing' and speaker_type = 'HCP' THEN pcp_closing_sub4 = 1;
   if subtopic = 'Logistics for testing' and speaker_type = 'PT' THEN sp_closing_sub4 = 1;
   if subtopic = 'Will wait for test results for decisions' and speaker_type = 'HCP' THEN pcp_closing_sub5 = 1;
   if subtopic = 'Will wait for test results for decisions' and speaker_type = 'PT' THEN sp_closing_sub5 = 1;
   if subtopic = 'Directions for acquiring medication' and speaker_type = 'HCP' THEN pcp_closing_sub6 = 1;
   if subtopic = 'Directions for acquiring medication' and speaker_type = 'PT' THEN sp_closing_sub6 = 1;
   if subtopic = 'When to return' and speaker_type = 'HCP' THEN pcp_closing_sub7 = 1;
   if subtopic = 'When to return' and speaker_type = 'PT' THEN sp_closing_sub7 = 1;
   if subtopic = 'Keep in touch' and speaker_type = 'HCP' THEN pcp_closing_sub8 = 1;
   if subtopic = 'Keep in touch' and speaker_type = 'PT' THEN sp_closing_sub8 = 1;
   if subtopic = 'If symptoms worsen, what to do' and speaker_type = 'HCP' THEN pcp_closing_sub9 = 1;
   if subtopic = 'If symptoms worsen, what to do' and speaker_type = 'PT' THEN sp_closing_sub9 = 1;
   if subtopic = 'What to do in an emergency' and speaker_type = 'HCP' THEN pcp_closing_sub10 = 1;
   if subtopic = 'What to do in an emergency' and speaker_type = 'PT' THEN sp_closing_sub10 = 1;
   if subtopic = 'Any problems, call' and speaker_type = 'HCP' THEN pcp_closing_sub11 = 1;
   if subtopic = 'Any problems, call' and speaker_type = 'PT' THEN sp_closing_sub11 = 1;
   if subtopic = 'How patient will be informed of results' and speaker_type = 'HCP' THEN pcp_closing_sub12 = 1;
   if subtopic = 'How patient will be informed of results' and speaker_type = 'PT' THEN sp_closing_sub12 = 1;
   if subtopic = 'Things to watch for/signs more serious' and speaker_type = 'HCP' THEN pcp_closing_sub13 = 1;
   if subtopic = 'Things to watch for/signs more serious' and speaker_type = 'PT' THEN sp_closing_sub13 = 1;
   if subtopic = 'Transition: nurse to doctor' and speaker_type = 'HCP' THEN pcp_closing_sub14 = 1;
   if subtopic = 'Transition: nurse to doctor' and speaker_type = 'PT' THEN sp_closing_sub14 = 1;
   if subtopic = 'General goodbye' and speaker_type = 'HCP' THEN pcp_closing_sub15 = 1;
   if subtopic = 'General goodbye' and speaker_type = 'PT' THEN sp_closing_sub15 = 1;
   if subtopic = 'Thank You' and speaker_type = 'HCP' THEN pcp_closing_sub16 = 1;
   if subtopic = 'Thank You' and speaker_type = 'PT' THEN sp_closing_sub16 = 1;
   if subtopic = 'Any other problems? Needs?' and speaker_type = 'HCP' THEN pcp_closing_sub17 = 1;
   if subtopic = 'Any other problems? Needs?' and speaker_type = 'PT' THEN sp_closing_sub17 = 1;
   if subtopic = 'Other questions' and speaker_type = 'HCP' THEN pcp_closing_sub18 = 1;
   if subtopic = 'Other questions' and speaker_type = 'PT' THEN sp_closing_sub18 = 1;

   if subtopic = 'Unintelligible' and speaker_type = 'HCP' THEN pcp_unint_sub1 = 1;
   if subtopic = 'Unintelligible' and speaker_type = 'PT' THEN sp_unint_sub1 = 1;
   if subtopic = 'Nonverbal Response' and speaker_type = 'HCP' THEN pcp_unint_sub2 = 1;
   if subtopic = 'Nonverbal Response' and speaker_type = 'PT' THEN sp_unint_sub2 = 1;

   if subtopic = 'Transition' and speaker_type = 'HCP' THEN pcp_bckch_sub1 = 1;
   if subtopic = 'Transition' and speaker_type = 'PT' THEN sp_bckch_sub1 = 1;
   if subtopic = 'Approving' and speaker_type = 'HCP' THEN pcp_bckch_sub2 = 1;
   if subtopic = 'Approving' and speaker_type = 'PT' THEN sp_bckch_sub2 = 1;
   if subtopic = 'Emphasis' and speaker_type = 'HCP' THEN pcp_bckch_sub3 = 1;
   if subtopic = 'Emphasis' and speaker_type = 'PT' THEN sp_bckch_sub3 = 1;
   if topic = 'Back Channels/Fillers' and subtopic = 'Noted' and speaker_type = 'HCP' THEN pcp_bckch_sub4 = 1;
   if topic = 'Back Channels/Fillers' and subtopic = 'Noted' and speaker_type = 'PT' THEN sp_bckch_sub4 = 1;
run;

data work.content16;
   set work.content14;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Altruism' and speaker_type = 'HCP' THEN pcp_altru = 1;
   if communication_type = 'Altruism' and speaker_type = 'PT' THEN sp_altru = 1;
   if communication_type = 'Esteem' and speaker_type = 'HCP' THEN pcp_esteem = 1;
   if communication_type = 'Esteem' and speaker_type = 'PT' THEN sp_esteem = 1;
   if communication_type = 'Guilt/Debt' and speaker_type = 'HCP' THEN pcp_guilt = 1;
   if communication_type = 'Guilt/Debt' and speaker_type = 'PT' THEN sp_guilt = 1;
   if communication_type = 'Foot in the door' and speaker_type = 'HCP' THEN pcp_foot = 1;
   if communication_type = 'Foot in the door' and speaker_type = 'PT' THEN sp_foot = 1;
   if communication_type = 'Threat' and speaker_type = 'HCP' THEN pcp_threat = 1;
   if communication_type = 'Threat' and speaker_type = 'PT' THEN sp_threat = 1;
   if communication_type = 'Emphasis' and speaker_type = 'HCP' THEN pcp_empha = 1;
   if communication_type = 'Emphasis' and speaker_type = 'PT' THEN sp_empha = 1;
   if communication_type = 'Approval' and speaker_type = 'HCP' THEN pcp_approval = 1;
   if communication_type = 'Approval' and speaker_type = 'PT' THEN sp_approval = 1;
   if communication_type = 'Repetition/Clarification' and speaker_type = 'HCP' THEN pcp_repeat = 1;
   if communication_type = 'Repetition/Clarification' and speaker_type = 'PT' THEN sp_repeat = 1;
   if communication_type = 'Offer of Service' and speaker_type = 'HCP' THEN pcp_offer = 1;
   if communication_type = 'Offer of Service' and speaker_type = 'PT' THEN sp_offer = 1;
   if communication_type = 'Concern/Empathy' and speaker_type = 'HCP' THEN pcp_empha = 1;
   if communication_type = 'Concern/Empathy' and speaker_type = 'PT' THEN sp_empha = 1;
   if communication_type = 'Legitimize/Acknowledge' and speaker_type = 'HCP' THEN pcp_legit = 1;
   if communication_type = 'Legitimize/Acknowledge' and speaker_type = 'PT' THEN sp_legit = 1;
   if communication_type = 'Apology' and speaker_type = 'HCP' THEN pcp_apology = 1;
   if communication_type = 'Apology' and speaker_type = 'PT' THEN sp_apology = 1;
   if communication_type = 'Reassurance' and speaker_type = 'HCP' THEN pcp_reassur = 1;
   if communication_type = 'Reassurance' and speaker_type = 'PT' THEN sp_reassur = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
   if communication_type = 'Argument' and speaker_type = 'HCP' THEN pcp_arg = 1;
   if communication_type = 'Argument' and speaker_type = 'PT' THEN sp_arg = 1;
   if communication_type = 'Refutation' and speaker_type = 'HCP' THEN pcp_refut = 1;
   if communication_type = 'Refutation' and speaker_type = 'PT' THEN sp_refut = 1;
run;


PROC SQL;
create table WORK.content_merge4 as
Select
CONTENT9.case_id,
SUM(CONTENT9.pcp_int) as pcp_int label="Frequency counts of Introduction utterances for PCP",
SUM(CONTENT9.sp_int) as sp_int label="Frequency counts of Introduction utterances for SP",
SUM(CONTENT9.pcp_medhist) as pcp_medhist label="Frequency counts of Medical History utterances for PCP",
SUM(CONTENT9.sp_medhist) as sp_medh1 label="Frequency counts of Medical History utterances for SP",
SUM(CONTENT9.pcp_gimedhist) as pcp_gimedhist label="Frequency counts of GI Medical History utterances for PCP",
SUM(CONTENT9.sp_gimedhist) as sp_gimedhist label="Frequency counts of GI Medical History utterances for SP",
SUM(CONTENT9.pcp_fammedhist) as pcp_fammedhist label="Frequency counts of Family Medical History utterances for PCP",
SUM(CONTENT9.sp_fammedhist) as sp_fammedhist label="Frequency counts of Family Medical History utterances for SP",
SUM(CONTENT9.pcp_hlthbeh) as pcp_hlthbeh label="Frequency counts of Health Behaviors utterances for PCP",
SUM(CONTENT9.sp_hlthbeh) as sp_hlthbeh label="Frequency counts of Health Behaviors utterances for SP",
SUM(CONTENT9.pcp_psychinfo) as pcp_psychinfo label="Frequency counts of Psychosocial information utterances for PCP",
SUM(CONTENT9.sp_psychinfo) as sp_psychinfo label="Frequency counts of Psychosocial information utterances for SP",
SUM(CONTENT9.pcp_physexam) as pcp_physexam label="Frequency counts of Physical exam utterances for PCP",
SUM(CONTENT9.sp_physexam) as sp_physexam label="Frequency counts of Physical exam utterances for SP",
SUM(CONTENT9.pcp_sympt) as pcp_sympt label="Frequency counts of Symptoms utterances for PCP",
SUM(CONTENT9.sp_sympt) as sp_sympt label="Frequency counts of Symptoms utterances for SP",
SUM(CONTENT9.pcp_oript) as pcp_oript label="Frequency counts of Orients patient utterances for PCP",
SUM(CONTENT9.sp_oript) as sp_oript label="Frequency counts of Orients patient utterances for SP",
SUM(CONTENT9.pcp_fin) as pcp_fin label="Frequency counts of Financial utterances for PCP",
SUM(CONTENT9.sp_fin) as sp_fin label="Frequency counts of Financial utterances for SP",
SUM(CONTENT9.pcp_possdiag) as pcp_possdiag label="Frequency counts of Possible Diagnoses utterances for PCP",
SUM(CONTENT9.sp_possdiag) as sp_possdiag label="Frequency counts of Possible Diagnoses utterances for SP",
SUM(CONTENT9.pcp_ref) as pcp_ref label="Frequency counts of Referrals utterances for PCP",
SUM(CONTENT9.sp_ref) as sp_ref label="Frequency counts of Referrals utterances for SP",
SUM(CONTENT9.sp_tests) as sp_tests label="Frequency counts of Tests utterances for PCP",
SUM(CONTENT9.pcp_tests) as pcp_tests label="Frequency counts of Tests utterances for SP",
SUM(CONTENT9.pcp_med) as pcp_med label="Frequency counts of Medication utterances for PCP",
SUM(CONTENT9.sp_med) as sp_med label="Frequency counts of Medication utterances for SP",
SUM(CONTENT9.pcp_othertx) as pcp_othertx label="Frequency counts of Other treatments utterances for PCP",
SUM(CONTENT9.sp_othertx) as sp_othertx label="Frequency counts of Other treatments utterances for SP",
SUM(CONTENT9.pcp_emot) as pcp_emot label="Frequency counts of Emotions utterances for PCP",
SUM(CONTENT9.sp_emot) as sp_emot label="Frequency counts of Emotions utterances for SP",
SUM(CONTENT9.pcp_social) as pcp_social label="Frequency counts of Social chitchat utterances for PCP",
SUM(CONTENT9.sp_social) as sp_social label="Frequency counts of Social chitchat utterances for SP",
SUM(CONTENT9.pcp_closing) as pcp_closing label="Frequency counts of Closing utterances for PCP",
SUM(CONTENT9.sp_closing) as sp_closing label="Frequency counts of Closing utterances for SP",
SUM(CONTENT9.pcp_unint) as pcp_unint label="Frequency counts of Unintelligible utterances for PCP",
SUM(CONTENT9.sp_unint) as sp_unint label="Frequency counts of Unintelligible utterances for SP",
SUM(CONTENT9.pcp_bckch) as pcp_bckch label="Frequency counts of Back channel/Filler utterances for PCP",
SUM(CONTENT9.sp_bckch) as sp_bckch label="Frequency counts of Back channel/Filler utterances for SP",

SUM(CONTENT9.pcp_int_sub1) as pcp_int_sub1 label="SUM(pcp_int_sub1)",
SUM(CONTENT9.sp_int_sub1) as sp_int_sub1 label="SUM(sp_int_sub1)",
SUM(CONTENT9.pcp_int_sub2) as pcp_int_sub2 label="SUM(pcp_int_sub2)",
SUM(CONTENT9.sp_int_sub2) as sp_int_sub2 label="SUM(sp_int_sub2)",
SUM(CONTENT9.pcp_int_sub3) as pcp_sub3 label="SUM(pcp_int_sub3)",
SUM(CONTENT9.sp_int_sub3) as sp_int_sub3 label="SUM(sp_int_sub3)",
SUM(CONTENT9.pcp_int_sub4) as pcp_sub4 label="SUM(pcp_int_sub4)",
SUM(CONTENT9.sp_int_sub4) as sp_int_sub4 label="SUM(sp_int_sub4)",
SUM(CONTENT9.pcp_int_sub5) as pcp_sub5 label="SUM(pcp_int_sub5)",
SUM(CONTENT9.sp_int_sub5) as sp_int_sub5 label="SUM(sp_int_sub5)",
SUM(CONTENT9.pcp_int_sub6) as pcp_intsub6 label="SUM(pcp_int_sub6)",
SUM(CONTENT9.sp_int_sub6) as sp_int_sub6 label="SUM(sp_int_sub6)",
SUM(CONTENT9.pcp_medhist_sub1) as pcp_m179 label="SUM(pcp_medhist_sub1)",
SUM(CONTENT9.sp_medhist_sub1) as sp_me179 label="SUM(sp_medhist_sub1)",
SUM(CONTENT9.pcp_medhist_sub2) as pcp_m169 label="SUM(pcp_medhist_sub2)",
SUM(CONTENT9.sp_medhist_sub2) as sp_me169 label="SUM(sp_medhist_sub2)",
SUM(CONTENT9.pcp_medhist_sub3) as pcp_m159 label="SUM(pcp_medhist_sub3)",
SUM(CONTENT9.sp_medhist_sub3) as sp_me159 label="SUM(sp_medhist_sub3)",
SUM(CONTENT9.sp_medhist_sub4) as sp_me149 label="SUM(sp_medhist_sub4)",
SUM(CONTENT9.pcp_medhist_sub4) as pcp_m149 label="SUM(pcp_medhist_sub4)",
SUM(CONTENT9.pcp_medhist_sub5) as pcp_m139 label="SUM(pcp_medhist_sub5)",
SUM(CONTENT9.sp_medhist_sub5) as sp_me139 label="SUM(sp_medhist_sub5)",
SUM(CONTENT9.pcp_medhist_sub6) as pcp_m129 label="SUM(pcp_medhist_sub6)",
SUM(CONTENT9.sp_medhist_sub6) as sp_me129 label="SUM(sp_medhist_sub6)",
SUM(CONTENT9.pcp_medhist_sub7) as pcp_m119 label="SUM(pcp_medhist_sub7)",
SUM(CONTENT9.sp_medhist_sub7) as sp_me119 label="SUM(sp_medhist_sub7)",
SUM(CONTENT9.pcp_medhist_sub8) as pcp_m109 label="SUM(pcp_medhist_sub8)",
SUM(CONTENT9.sp_medhist_sub8) as sp_me109 label="SUM(sp_medhist_sub8)",
SUM(CONTENT9.pcp_medhist_sub9) as pcp_med9 label="SUM(pcp_medhist_sub9)",
SUM(CONTENT9.sp_medhist_sub9) as sp_medh9 label="SUM(sp_medhist_sub9)",
SUM(CONTENT9.pcp_medhist_sub10) as pcp_med8 label="SUM(pcp_medhist_sub10)",
SUM(CONTENT9.sp_medhist_sub10) as sp_medh7 label="SUM(sp_medhist_sub10)",
SUM(CONTENT9.sp_medhist_sub11) as sp_medh8 label="SUM(sp_medhist_sub11)",
SUM(CONTENT9.pcp_medhist_sub11) as pcp_med7 label="SUM(pcp_medhist_sub11)",
SUM(CONTENT9.pcp_medhist_sub12) as pcp_med6 label="SUM(pcp_medhist_sub12)",
SUM(CONTENT9.sp_medhist_sub12) as sp_medh6 label="SUM(sp_medhist_sub12)",
SUM(CONTENT9.sp_medhist_sub13) as sp_medh5 label="SUM(sp_medhist_sub13)",
SUM(CONTENT9.pcp_medhist_sub13) as pcp_med5 label="SUM(pcp_medhist_sub13)",
SUM(CONTENT9.pcp_medhist_sub14) as pcp_med4 label="SUM(pcp_medhist_sub14)",
SUM(CONTENT9.pcp_medhist_sub15) as pcp_med3 label="SUM(pcp_medhist_sub15)",
SUM(CONTENT9.sp_medhist_sub14) as sp_medh3 label="SUM(sp_medhist_sub14)",
SUM(CONTENT9.sp_medhist_sub15) as sp_medh4 label="SUM(sp_medhist_sub15)",
SUM(CONTENT9.pcp_medhist_sub16) as pcp_med2 label="SUM(pcp_medhist_sub16)",
SUM(CONTENT9.sp_medhist_sub16) as sp_medh2 label="SUM(sp_medhist_sub16)",
SUM(CONTENT9.sp_gimed_sub1) as sp_gi119 label="SUM(sp_gimed_sub1)",
SUM(CONTENT9.pcp_gimed_sub1) as pcp_g119 label="SUM(pcp_gimed_sub1)",
SUM(CONTENT9.pcp_gimed_sub2) as pcp_gim9 label="SUM(pcp_gimed_sub2)",
SUM(CONTENT9.sp_gimed_sub2) as sp_gi109 label="SUM(sp_gimed_sub2)",
SUM(CONTENT9.pcp_gimed_sub3) as pcp_g109 label="SUM(pcp_gimed_sub3)",
SUM(CONTENT9.sp_gimed_sub3) as sp_gime8 label="SUM(sp_gimed_sub3)",
SUM(CONTENT9.pcp_gimed_sub4) as pcp_gim8 label="SUM(pcp_gimed_sub4)",
SUM(CONTENT9.sp_gimed_sub4) as sp_gime9 label="SUM(sp_gimed_sub4)",
SUM(CONTENT9.pcp_gimed_sub5) as pcp_gim7 label="SUM(pcp_gimed_sub5)",
SUM(CONTENT9.sp_gimed_sub5) as sp_gime7 label="SUM(sp_gimed_sub5)",
SUM(CONTENT9.pcp_gimed_sub6) as pcp_gim5 label="SUM(pcp_gimed_sub6)",
SUM(CONTENT9.pcp_gimed_sub7) as pcp_gim6 label="SUM(pcp_gimed_sub7)",
SUM(CONTENT9.sp_gimed_sub6) as sp_gime6 label="SUM(sp_gimed_sub6)",
SUM(CONTENT9.sp_gimed_sub7) as sp_gime5 label="SUM(sp_gimed_sub7)",
SUM(CONTENT9.pcp_gimed_sub8) as pcp_gim4 label="SUM(pcp_gimed_sub8)",
SUM(CONTENT9.sp_gimed_sub8) as sp_gime4 label="SUM(sp_gimed_sub8)",
SUM(CONTENT9.pcp_gimed_sub9) as pcp_gim3 label="SUM(pcp_gimed_sub9)",
SUM(CONTENT9.pcp_gimed_sub10) as pcp_gim2 label="SUM(pcp_gimed_sub10)",
SUM(CONTENT9.sp_gimed_sub9) as sp_gime3 label="SUM(sp_gimed_sub9)",
SUM(CONTENT9.sp_gimed_sub10) as sp_gime2 label="SUM(sp_gimed_sub10)",
SUM(CONTENT9.pcp_fammed_sub1) as pcp_fam5 label="SUM(pcp_fammed_sub1)",
SUM(CONTENT9.sp_fammed_sub1) as sp_famm5 label="SUM(sp_fammed_sub1)",
SUM(CONTENT9.pcp_fammed_sub2) as pcp_fam4 label="SUM(pcp_fammed_sub2)",
SUM(CONTENT9.sp_fammed_sub2) as sp_famm4 label="SUM(sp_fammed_sub2)",
SUM(CONTENT9.pcp_fammed_sub3) as pcp_fam3 label="SUM(pcp_fammed_sub3)",
SUM(CONTENT9.sp_fammed_sub3) as sp_famm3 label="SUM(sp_fammed_sub3)",
SUM(CONTENT9.pcp_fammed_sub4) as pcp_fam2 label="SUM(pcp_fammed_sub4)",
SUM(CONTENT9.sp_fammed_sub4) as sp_famm2 label="SUM(sp_fammed_sub4)",
SUM(CONTENT9.pcp_hlthbeh_sub1) as pcp_hlt2 label="SUM(pcp_hlthbeh_sub1)",
SUM(CONTENT9.sp_hlthbeh_sub1) as sp_hlth2 label="SUM(sp_hlthbeh_sub1)",
SUM(CONTENT9.pcp_hlthbeh_sub2) as pcp_hlt3 label="SUM(pcp_hlthbeh_sub2)",
SUM(CONTENT9.sp_hlthbeh_sub2) as sp_hlth3 label="SUM(sp_hlthbeh_sub2)",
SUM(CONTENT9.pcp_hlthbeh_sub3) as pcp_hlt4 label="SUM(pcp_hlthbeh_sub3)",
SUM(CONTENT9.sp_hlthbeh_sub3) as sp_hlth4 label="SUM(sp_hlthbeh_sub3)",
SUM(CONTENT9.pcp_hlthbeh_sub4) as pcp_hlt6 label="SUM(pcp_hlthbeh_sub4)",
SUM(CONTENT9.pcp_hlthbeh_sub5) as pcp_hlt5 label="SUM(pcp_hlthbeh_sub5)",
SUM(CONTENT9.sp_hlthbeh_sub4) as sp_hlth5 label="SUM(sp_hlthbeh_sub4)",
SUM(CONTENT9.sp_hlthbeh_sub5) as sp_hlth6 label="SUM(sp_hlthbeh_sub5)",
SUM(CONTENT9.pcp_hlthbeh_sub6) as pcp_hlt7 label="SUM(pcp_hlthbeh_sub6)",
SUM(CONTENT9.sp_hlthbeh_sub6) as sp_hlth7 label="SUM(sp_hlthbeh_sub6)",
SUM(CONTENT9.pcp_hlthbeh_sub7) as pcp_hlt8 label="SUM(pcp_hlthbeh_sub7)",
SUM(CONTENT9.sp_hlthbeh_sub7) as sp_hlth8 label="SUM(sp_hlthbeh_sub7)",
SUM(CONTENT9.pcp_hlthbeh_sub8) as pcp_hlt9 label="SUM(pcp_hlthbeh_sub8)",
SUM(CONTENT9.sp_hlthbeh_sub8) as sp_hlth9 label="SUM(sp_hlthbeh_sub8)",
SUM(CONTENT9.pcp_psychinfo_sub1) as pcp_psy3 label="SUM(pcp_psychinfo_sub1)",
SUM(CONTENT9.sp_psychinfo_sub1) as sp_psyc2 label="SUM(sp_psychinfo_sub1)",
SUM(CONTENT9.pcp_psychinfo_sub2) as pcp_psy4 label="SUM(pcp_psychinfo_sub2)",
SUM(CONTENT9.pcp_psychinfo_sub3) as pcp_psy5 label="SUM(pcp_psychinfo_sub3)",
SUM(CONTENT9.sp_psychinfo_sub2) as sp_psyc3 label="SUM(sp_psychinfo_sub2)",
SUM(CONTENT9.sp_psychinfo_sub3) as sp_psyc4 label="SUM(sp_psychinfo_sub3)",
SUM(CONTENT9.pcp_psychinfo_sub4) as pcp_psy6 label="SUM(pcp_psychinfo_sub4)",
SUM(CONTENT9.sp_psychinfo_sub4) as sp_psyc5 label="SUM(sp_psychinfo_sub4)",
SUM(CONTENT9.pcp_psychinfo_sub5) as pcp_psy7 label="SUM(pcp_psychinfo_sub5)",
SUM(CONTENT9.pcp_psychinfo_sub7) as pcp_psy2 label="SUM(pcp_psychinfo_sub7)",
SUM(CONTENT9.sp_psychinfo_sub6) as sp_psyc7 label="SUM(sp_psychinfo_sub6)",
SUM(CONTENT9.pcp_psychinfo_sub6) as pcp_psy8 label="SUM(pcp_psychinfo_sub6)",
SUM(CONTENT9.sp_psychinfo_sub5) as sp_psyc9 label="SUM(sp_psychinfo_sub5)",
SUM(CONTENT9.sp_psychinfo_sub7) as sp_psyc8 label="SUM(sp_psychinfo_sub7)",
SUM(CONTENT9.pcp_psychinfo_sub8) as pcp_psy9 label="SUM(pcp_psychinfo_sub8)",
SUM(CONTENT9.sp_psychinfo_sub8) as sp_ps109 label="SUM(sp_psychinfo_sub8)",
SUM(CONTENT9.pcp_psychinfo_sub9) as pcp_p109 label="SUM(pcp_psychinfo_sub9)",
SUM(CONTENT9.sp_psychinfo_sub9) as sp_ps119 label="SUM(sp_psychinfo_sub9)",
SUM(CONTENT9.sp_psychinfo_sub10) as sp_ps129 label="SUM(sp_psychinfo_sub10)",
SUM(CONTENT9.pcp_psychinfo_sub10) as pcp_p129 label="SUM(pcp_psychinfo_sub10)",
SUM(CONTENT9.pcp_psychinfo_sub11) as pcp_p119 label="SUM(pcp_psychinfo_sub11)",
SUM(CONTENT9.sp_psychinfo_sub11) as sp_ps139 label="SUM(sp_psychinfo_sub11)",
SUM(CONTENT9.pcp_psychinfo_sub12) as pcp_p139 label="SUM(pcp_psychinfo_sub12)",
SUM(CONTENT9.pcp_psychinfo_sub13) as pcp_p149 label="SUM(pcp_psychinfo_sub13)",
SUM(CONTENT9.sp_psychinfo_sub12) as sp_ps149 label="SUM(sp_psychinfo_sub12)",
SUM(CONTENT9.sp_psychinfo_sub13) as sp_ps159 label="SUM(sp_psychinfo_sub13)",
SUM(CONTENT9.pcp_psychinfo_sub14) as pcp_p159 label="SUM(pcp_psychinfo_sub14)",
SUM(CONTENT9.sp_psychinfo_sub14) as sp_ps169 label="SUM(sp_psychinfo_sub14)",
SUM(CONTENT9.pcp_psychinfo_sub15) as pcp_p169 label="SUM(pcp_psychinfo_sub15)",
SUM(CONTENT9.sp_psychinfo_sub15) as sp_psyc6 label="SUM(sp_psychinfo_sub15)",
SUM(CONTENT9.pcp_physexam_sub1) as pcp_phy2 label="SUM(pcp_physexam_sub1)",
SUM(CONTENT9.sp_physexam_sub1) as sp_phys3 label="SUM(sp_physexam_sub1)",
SUM(CONTENT9.pcp_physexam_sub2) as pcp_phy3 label="SUM(pcp_physexam_sub2)",
SUM(CONTENT9.sp_physexam_sub2) as sp_phys4 label="SUM(sp_physexam_sub2)",
SUM(CONTENT9.pcp_physexam_sub3) as pcp_phy4 label="SUM(pcp_physexam_sub3)",
SUM(CONTENT9.sp_physexam_sub3) as sp_phys5 label="SUM(sp_physexam_sub3)",
SUM(CONTENT9.pcp_physexam_sub4) as pcp_phy5 label="SUM(pcp_physexam_sub4)",
SUM(CONTENT9.sp_physexam_sub4) as sp_phys6 label="SUM(sp_physexam_sub4)",
SUM(CONTENT9.pcp_physexam_sub5) as pcp_phy6 label="SUM(pcp_physexam_sub5)",
SUM(CONTENT9.sp_physexam_sub5) as sp_phys7 label="SUM(sp_physexam_sub5)",
SUM(CONTENT9.pcp_physexam_sub6) as pcp_phy7 label="SUM(pcp_physexam_sub6)",
SUM(CONTENT9.sp_physexam_sub6) as sp_phys8 label="SUM(sp_physexam_sub6)",
SUM(CONTENT9.pcp_physexam_sub7) as pcp_phy8 label="SUM(pcp_physexam_sub7)",
SUM(CONTENT9.sp_physexam_sub7) as sp_phys9 label="SUM(sp_physexam_sub7)",
SUM(CONTENT9.pcp_physexam_sub8) as pcp_phy9 label="SUM(pcp_physexam_sub8)",
SUM(CONTENT9.sp_physexam_sub8) as sp_ph109 label="SUM(sp_physexam_sub8)",
SUM(CONTENT9.pcp_physexam_sub9) as pcp_p179 label="SUM(pcp_physexam_sub9)",
SUM(CONTENT9.sp_physexam_sub9) as sp_ph119 label="SUM(sp_physexam_sub9)",
SUM(CONTENT9.pcp_physexam_sub10) as pcp_p189 label="SUM(pcp_physexam_sub10)",
SUM(CONTENT9.sp_physexam_sub10) as sp_ph129 label="SUM(sp_physexam_sub10)",
SUM(CONTENT9.pcp_physexam_sub11) as pcp_p199 label="SUM(pcp_physexam_sub11)",
SUM(CONTENT9.sp_physexam_sub11) as sp_ph139 label="SUM(sp_physexam_sub11)",
SUM(CONTENT9.pcp_physexam_sub12) as pcp_p209 label="SUM(pcp_physexam_sub12)",
SUM(CONTENT9.sp_physexam_sub12) as sp_ph149 label="SUM(sp_physexam_sub12)",
SUM(CONTENT9.pcp_physexam_sub13) as pcp_p219 label="SUM(pcp_physexam_sub13)",
SUM(CONTENT9.sp_physexam_sub13) as sp_ph159 label="SUM(sp_physexam_sub13)",
SUM(CONTENT9.pcp_physexam_sub14) as pcp_p229 label="SUM(pcp_physexam_sub14)",
SUM(CONTENT9.sp_physexam_sub14) as sp_ph169 label="SUM(sp_physexam_sub14)",
SUM(CONTENT9.pcp_physexam_sub15) as pcp_p239 label="SUM(pcp_physexam_sub15)",
SUM(CONTENT9.sp_physexam_sub15) as sp_phys2 label="SUM(sp_physexam_sub15)",
SUM(CONTENT9.sp_sympt_sub1) as sp_symp2 label="SUM(sp_sympt_sub1)",
SUM(CONTENT9.pcp_sympt_sub1) as pcp_sym3 label="SUM(pcp_sympt_sub1)",
SUM(CONTENT9.pcp_sympt_sub2) as pcp_sym4 label="SUM(pcp_sympt_sub2)",
SUM(CONTENT9.sp_sympt_sub2) as sp_symp3 label="SUM(sp_sympt_sub2)",
SUM(CONTENT9.pcp_sympt_sub3) as pcp_sym5 label="SUM(pcp_sympt_sub3)",
SUM(CONTENT9.pcp_sympt_sub4) as pcp_sym6 label="SUM(pcp_sympt_sub4)",
SUM(CONTENT9.sp_sympt_sub3) as sp_symp4 label="SUM(sp_sympt_sub3)",
SUM(CONTENT9.sp_sympt_sub4) as sp_symp5 label="SUM(sp_sympt_sub4)",
SUM(CONTENT9.pcp_sympt_sub5) as pcp_sym7 label="SUM(pcp_sympt_sub5)",
SUM(CONTENT9.sp_sympt_sub5) as sp_symp6 label="SUM(sp_sympt_sub5)",
SUM(CONTENT9.pcp_sympt_sub6) as pcp_sym8 label="SUM(pcp_sympt_sub6)",
SUM(CONTENT9.sp_sympt_sub6) as sp_symp7 label="SUM(sp_sympt_sub6)",
SUM(CONTENT9.pcp_sympt_sub7) as pcp_sym9 label="SUM(pcp_sympt_sub7)",
SUM(CONTENT9.sp_sympt_sub7) as sp_symp8 label="SUM(sp_sympt_sub7)",
SUM(CONTENT9.pcp_sympt_sub8) as pcp_s109 label="SUM(pcp_sympt_sub8)",
SUM(CONTENT9.sp_sympt_sub8) as sp_symp9 label="SUM(sp_sympt_sub8)",
SUM(CONTENT9.pcp_sympt_sub9) as pcp_s119 label="SUM(pcp_sympt_sub9)",
SUM(CONTENT9.sp_sympt_sub9) as sp_sy109 label="SUM(sp_sympt_sub9)",
SUM(CONTENT9.pcp_sympt_sub10) as pcp_s129 label="SUM(pcp_sympt_sub10)",
SUM(CONTENT9.sp_sympt_sub10) as sp_sy119 label="SUM(sp_sympt_sub10)",
SUM(CONTENT9.pcp_sympt_sub11) as pcp_s139 label="SUM(pcp_sympt_sub11)",
SUM(CONTENT9.sp_sympt_sub11) as sp_sy129 label="SUM(sp_sympt_sub11)",
SUM(CONTENT9.pcp_sympt_sub12) as pcp_s149 label="SUM(pcp_sympt_sub12)",
SUM(CONTENT9.sp_sympt_sub12) as sp_sy139 label="SUM(sp_sympt_sub12)",
SUM(CONTENT9.pcp_sympt_sub13) as pcp_sym2 label="SUM(pcp_sympt_sub13)",
SUM(CONTENT9.pcp_sympt_sub14) as pcp_s169 label="SUM(pcp_sympt_sub14)",
SUM(CONTENT9.sp_sympt_sub13) as sp_sy149 label="SUM(sp_sympt_sub13)",
SUM(CONTENT9.sp_sympt_sub14) as sp_sy159 label="SUM(sp_sympt_sub14)",
SUM(CONTENT9.pcp_sympt_sub15) as pcp_s189 label="SUM(pcp_sympt_sub15)",
SUM(CONTENT9.pcp_sympt_sub16) as pcp_s179 label="SUM(pcp_sympt_sub16)",
SUM(CONTENT9.sp_sympt_sub15) as sp_sy169 label="SUM(sp_sympt_sub15)",
SUM(CONTENT9.sp_sympt_sub16) as sp_sy179 label="SUM(sp_sympt_sub16)",
SUM(CONTENT9.pcp_sympt_sub17) as pcp_s199 label="SUM(pcp_sympt_sub17)",
SUM(CONTENT9.pcp_sympt_sub18) as pcp_s209 label="SUM(pcp_sympt_sub18)",
SUM(CONTENT9.sp_sympt_sub17) as sp_sy189 label="SUM(sp_sympt_sub17)",
SUM(CONTENT9.sp_sympt_sub18) as sp_sy199 label="SUM(sp_sympt_sub18)",
SUM(CONTENT9.pcp_sympt_sub19) as pcp_s219 label="SUM(pcp_sympt_sub19)",
SUM(CONTENT9.sp_sympt_sub19) as sp_sy209 label="SUM(sp_sympt_sub19)",
SUM(CONTENT9.pcp_sympt_sub20) as pcp_s229 label="SUM(pcp_sympt_sub20)",
SUM(CONTENT9.sp_sympt_sub20) as sp_sy219 label="SUM(sp_sympt_sub20)",
SUM(CONTENT9.sp_sympt_sub21) as sp_sy229 label="SUM(sp_sympt_sub21)",
SUM(CONTENT9.pcp_sympt_sub21) as pcp_s239 label="SUM(pcp_sympt_sub21)",
SUM(CONTENT9.pcp_sympt_sub22) as pcp_s249 label="SUM(pcp_sympt_sub22)",
SUM(CONTENT9.sp_sympt_sub22) as sp_sy239 label="SUM(sp_sympt_sub22)",
SUM(CONTENT9.pcp_sympt_sub23) as pcp_s259 label="SUM(pcp_sympt_sub23)",
SUM(CONTENT9.sp_sympt_sub23) as sp_sy249 label="SUM(sp_sympt_sub23)",
SUM(CONTENT9.pcp_sympt_sub24) as pcp_s269 label="SUM(pcp_sympt_sub24)",
SUM(CONTENT9.sp_sympt_sub24) as sp_sy259 label="SUM(sp_sympt_sub24)",
SUM(CONTENT9.pcp_sympt_sub25) as pcp_s279 label="SUM(pcp_sympt_sub25)",
SUM(CONTENT9.sp_sympt_sub25) as sp_sy269 label="SUM(sp_sympt_sub25)",
SUM(CONTENT9.pcp_sympt_sub26) as pcp_s289 label="SUM(pcp_sympt_sub26)",
SUM(CONTENT9.sp_sympt_sub26) as sp_sy279 label="SUM(sp_sympt_sub26)",
SUM(CONTENT9.pcp_sympt_sub27) as pcp_s299 label="SUM(pcp_sympt_sub27)",
SUM(CONTENT9.sp_sympt_sub27) as sp_sy289 label="SUM(sp_sympt_sub27)",
SUM(CONTENT9.pcp_sympt_sub28) as pcp_s309 label="SUM(pcp_sympt_sub28)",
SUM(CONTENT9.sp_sympt_sub28) as sp_sy299 label="SUM(sp_sympt_sub28)",
SUM(CONTENT9.pcp_sympt_sub29) as pcp_s319 label="SUM(pcp_sympt_sub29)",
SUM(CONTENT9.sp_sympt_sub29) as sp_sy309 label="SUM(sp_sympt_sub29)",
SUM(CONTENT9.sp_sympt_sub30) as sp_sy319 label="SUM(sp_sympt_sub30)",
SUM(CONTENT9.pcp_sympt_sub30) as pcp_s159 label="SUM(pcp_sympt_sub30)",
SUM(CONTENT9.pcp_sympt_sub31) as pcp_s329 label="SUM(pcp_sympt_sub31)",
SUM(CONTENT9.sp_sympt_sub31) as sp_sy329 label="SUM(sp_sympt_sub31)",
SUM(CONTENT9.pcp_oript_sub1) as pcp_ori2 label="SUM(pcp_oript_sub1)",
SUM(CONTENT9.sp_oript_sub1) as sp_orip3 label="SUM(sp_oript_sub1)",
SUM(CONTENT9.sp_oript_sub2) as sp_orip2 label="SUM(sp_oript_sub2)",
SUM(CONTENT9.pcp_oript_sub2) as pcp_ori3 label="SUM(pcp_oript_sub2)",
SUM(CONTENT9.pcp_oript_sub3) as pcp_ori5 label="SUM(pcp_oript_sub3)",
SUM(CONTENT9.pcp_oript_sub4) as pcp_ori4 label="SUM(pcp_oript_sub4)",
SUM(CONTENT9.sp_oript_sub3) as sp_orip8 label="SUM(sp_oript_sub3)",
SUM(CONTENT9.sp_oript_sub4) as sp_orip7 label="SUM(sp_oript_sub4)",
SUM(CONTENT9.pcp_oript_sub5) as pcp_ori8 label="SUM(pcp_oript_sub5)",
SUM(CONTENT9.sp_oript_sub5) as sp_orip6 label="SUM(sp_oript_sub5)",
SUM(CONTENT9.sp_oript_sub6) as sp_orip5 label="SUM(sp_oript_sub6)",
SUM(CONTENT9.pcp_oript_sub6) as pcp_ori7 label="SUM(pcp_oript_sub6)",
SUM(CONTENT9.pcp_oript_sub7) as pcp_ori6 label="SUM(pcp_oript_sub7)",
SUM(CONTENT9.sp_oript_sub7) as sp_orip4 label="SUM(sp_oript_sub7)",
SUM(CONTENT9.pcp_fin_sub1) as pcp_fin1 label="SUM(pcp_fin_sub1)",
SUM(CONTENT9.sp_fin_sub1) as sp_fin_9 label="SUM(sp_fin_sub1)",
SUM(CONTENT9.pcp_fin_sub2) as pcp_fin9 label="SUM(pcp_fin_sub2)",
SUM(CONTENT9.sp_fin_sub2) as sp_fin_8 label="SUM(sp_fin_sub2)",
SUM(CONTENT9.sp_fin_sub3) as sp_fin_7 label="SUM(sp_fin_sub3)",
SUM(CONTENT9.pcp_fin_sub3) as pcp_fin8 label="SUM(pcp_fin_sub3)",
SUM(CONTENT9.pcp_fin_sub4) as pcp_fin7 label="SUM(pcp_fin_sub4)",
SUM(CONTENT9.sp_fin_sub4) as sp_fin_6 label="SUM(sp_fin_sub4)",
SUM(CONTENT9.pcp_fin_sub5) as pcp_fin6 label="SUM(pcp_fin_sub5)",
SUM(CONTENT9.sp_fin_sub5) as sp_fin_4 label="SUM(sp_fin_sub5)",
SUM(CONTENT9.sp_fin_sub6) as sp_fin_5 label="SUM(sp_fin_sub6)",
SUM(CONTENT9.pcp_fin_sub6) as pcp_fin5 label="SUM(pcp_fin_sub6)",
SUM(CONTENT9.pcp_fin_sub7) as pcp_fin4 label="SUM(pcp_fin_sub7)",
SUM(CONTENT9.pcp_fin_sub8) as pcp_fin3 label="SUM(pcp_fin_sub8)",
SUM(CONTENT9.sp_fin_sub7) as sp_fin_3 label="SUM(sp_fin_sub7)",
SUM(CONTENT9.sp_fin_sub8) as sp_fin_2 label="SUM(sp_fin_sub8)",
SUM(CONTENT9.pcp_fin_sub9) as pcp_fin2 label="SUM(pcp_fin_sub9)",
SUM(CONTENT9.sp_fin_sub9) as sp_fin_1 label="SUM(sp_fin_sub9)",
SUM(CONTENT9.pcp_possdiag_sub1) as pcp_pos2 label="SUM(pcp_possdiag_sub1)",
SUM(CONTENT9.sp_possdiag_sub1) as sp_po249 label="SUM(sp_possdiag_sub1)",
SUM(CONTENT9.pcp_possdiag_sub2) as pcp_p399 label="SUM(pcp_possdiag_sub2)",
SUM(CONTENT9.sp_possdiag_sub2) as sp_po259 label="SUM(sp_possdiag_sub2)",
SUM(CONTENT9.pcp_possdiag_sub3) as pcp_p359 label="SUM(pcp_possdiag_sub3)",
SUM(CONTENT9.sp_possdiag_sub3) as sp_po209 label="SUM(sp_possdiag_sub3)",
SUM(CONTENT9.pcp_possdiag_sub4) as pcp_p369 label="SUM(pcp_possdiag_sub4)",
SUM(CONTENT9.sp_possdiag_sub4) as sp_po219 label="SUM(sp_possdiag_sub4)",
SUM(CONTENT9.pcp_possdiag_sub5) as pcp_p379 label="SUM(pcp_possdiag_sub5)",
SUM(CONTENT9.sp_possdiag_sub5) as sp_po239 label="SUM(sp_possdiag_sub5)",
SUM(CONTENT9.sp_possdiag_sub6) as sp_po229 label="SUM(sp_possdiag_sub6)",
SUM(CONTENT9.pcp_possdiag_sub6) as pcp_p389 label="SUM(pcp_possdiag_sub6)",
SUM(CONTENT9.pcp_possdiag_sub7) as pcp_p329 label="SUM(pcp_possdiag_sub7)",
SUM(CONTENT9.sp_possdiag_sub7) as sp_po189 label="SUM(sp_possdiag_sub7)",
SUM(CONTENT9.sp_possdiag_sub8) as sp_po179 label="SUM(sp_possdiag_sub8)",
SUM(CONTENT9.pcp_possdiag_sub10) as pcp_p349 label="SUM(pcp_possdiag_sub10)",
SUM(CONTENT9.sp_possdiag_sub9) as sp_po199 label="SUM(sp_possdiag_sub9)",
SUM(CONTENT9.pcp_possdiag_sub9) as pcp_p339 label="SUM(pcp_possdiag_sub9)",
SUM(CONTENT9.pcp_possdiag_sub8) as pcp_p319 label="SUM(pcp_possdiag_sub8)",
SUM(CONTENT9.sp_possdiag_sub10) as sp_po159 label="SUM(sp_possdiag_sub10)",
SUM(CONTENT9.sp_possdiag_sub17) as sp_po169 label="SUM(sp_possdiag_sub17)",
SUM(CONTENT9.pcp_possdiag_sub15) as pcp_p309 label="SUM(pcp_possdiag_sub15)",
SUM(CONTENT9.sp_possdiag_sub13) as sp_po149 label="SUM(sp_possdiag_sub13)",
SUM(CONTENT9.pcp_possdiag_sub13) as pcp_p299 label="SUM(pcp_possdiag_sub13)",
SUM(CONTENT9.sp_possdiag_sub12) as sp_po139 label="SUM(sp_possdiag_sub12)",
SUM(CONTENT9.pcp_possdiag_sub12) as pcp_p289 label="SUM(pcp_possdiag_sub12)",
SUM(CONTENT9.sp_possdiag_sub11) as sp_po129 label="SUM(sp_possdiag_sub11)",
SUM(CONTENT9.pcp_possdiag_sub11) as pcp_p279 label="SUM(pcp_possdiag_sub11)",
SUM(CONTENT9.sp_possdiag_sub14) as sp_po119 label="SUM(sp_possdiag_sub14)",
SUM(CONTENT9.pcp_possdiag_sub14) as pcp_p269 label="SUM(pcp_possdiag_sub14)",
SUM(CONTENT9.sp_possdiag_sub15) as sp_po109 label="SUM(sp_possdiag_sub15)",
SUM(CONTENT9.pcp_possdiag_sub16) as pcp_p259 label="SUM(pcp_possdiag_sub16)",
SUM(CONTENT9.sp_possdiag_sub16) as sp_poss9 label="SUM(sp_possdiag_sub16)",
SUM(CONTENT9.pcp_possdiag_sub17) as pcp_p249 label="SUM(pcp_possdiag_sub17)",
SUM(CONTENT9.sp_possdiag_sub18) as sp_poss8 label="SUM(sp_possdiag_sub18)",
SUM(CONTENT9.pcp_possdiag_sub18) as pcp_pos9 label="SUM(pcp_possdiag_sub18)",
SUM(CONTENT9.sp_possdiag_sub19) as sp_poss7 label="SUM(sp_possdiag_sub19)",
SUM(CONTENT9.pcp_possdiag_sub20) as pcp_pos8 label="SUM(pcp_possdiag_sub20)",
SUM(CONTENT9.sp_possdiag_sub20) as sp_poss5 label="SUM(sp_possdiag_sub20)",
SUM(CONTENT9.sp_possdiag_sub21) as sp_poss6 label="SUM(sp_possdiag_sub21)",
SUM(CONTENT9.pcp_possdiag_sub21) as pcp_pos7 label="SUM(pcp_possdiag_sub21)",
SUM(CONTENT9.pcp_possdiag_sub19) as pcp_pos6 label="SUM(pcp_possdiag_sub19)",
SUM(CONTENT9.pcp_possdiag_sub22) as pcp_pos5 label="SUM(pcp_possdiag_sub22)",
SUM(CONTENT9.pcp_possdiag_sub23) as pcp_pos4 label="SUM(pcp_possdiag_sub23)",
SUM(CONTENT9.sp_possdiag_sub22) as sp_poss4 label="SUM(sp_possdiag_sub22)",
SUM(CONTENT9.pcp_possdiag_sub30) as pcp_pos3 label="SUM(pcp_possdiag_sub30)",
SUM(CONTENT9.sp_possdiag_sub28) as sp_poss3 label="SUM(sp_possdiag_sub28)",
SUM(CONTENT9.sp_possdiag_sub27) as sp_poss2 label="SUM(sp_possdiag_sub27)",
SUM(CONTENT9.sp_possdiag_sub26) as sp_po279 label="SUM(sp_possdiag_sub26)",
SUM(CONTENT9.pcp_possdiag_sub26) as pcp_p409 label="SUM(pcp_possdiag_sub26)",
SUM(CONTENT9.sp_possdiag_sub25) as sp_po289 label="SUM(sp_possdiag_sub25)",
SUM(CONTENT9.sp_possdiag_sub24) as sp_po299 label="SUM(sp_possdiag_sub24)",
SUM(CONTENT9.pcp_possdiag_sub25) as pcp_p419 label="SUM(pcp_possdiag_sub25)",
SUM(CONTENT9.pcp_possdiag_sub24) as pcp_p429 label="SUM(pcp_possdiag_sub24)",
SUM(CONTENT9.sp_possdiag_sub23) as sp_po309 label="SUM(sp_possdiag_sub23)",
SUM(CONTENT9.pcp_possdiag_sub27) as pcp_p439 label="SUM(pcp_possdiag_sub27)",
SUM(CONTENT9.pcp_possdiag_sub28) as pcp_p509 label="SUM(pcp_possdiag_sub28)",
SUM(CONTENT9.pcp_possdiag_sub29) as pcp_p519 label="SUM(pcp_possdiag_sub29)",
SUM(CONTENT9.sp_possdiag_sub29) as sp_po379 label="SUM(sp_possdiag_sub29)",
SUM(CONTENT9.sp_possdiag_sub36) as sp_po359 label="SUM(sp_possdiag_sub36)",
SUM(CONTENT9.pcp_possdiag_sub36) as pcp_p489 label="SUM(pcp_possdiag_sub36)",
SUM(CONTENT9.sp_possdiag_sub35) as sp_po369 label="SUM(sp_possdiag_sub35)",
SUM(CONTENT9.pcp_possdiag_sub35) as pcp_p499 label="SUM(pcp_possdiag_sub35)",
SUM(CONTENT9.sp_possdiag_sub34) as sp_po339 label="SUM(sp_possdiag_sub34)",
SUM(CONTENT9.pcp_possdiag_sub34) as pcp_p479 label="SUM(pcp_possdiag_sub34)",
SUM(CONTENT9.sp_possdiag_sub33) as sp_po349 label="SUM(sp_possdiag_sub33)",
SUM(CONTENT9.pcp_possdiag_sub33) as pcp_p469 label="SUM(pcp_possdiag_sub33)",
SUM(CONTENT9.sp_possdiag_sub32) as sp_po329 label="SUM(sp_possdiag_sub32)",
SUM(CONTENT9.pcp_possdiag_sub32) as pcp_p459 label="SUM(pcp_possdiag_sub32)",
SUM(CONTENT9.sp_possdiag_sub31) as sp_po319 label="SUM(sp_possdiag_sub31)",
SUM(CONTENT9.pcp_possdiag_sub31) as pcp_p449 label="SUM(pcp_possdiag_sub31)",
SUM(CONTENT9.sp_possdiag_sub30) as sp_po269 label="SUM(sp_possdiag_sub30)",
SUM(CONTENT9.sp_ref_sub6) as sp_ref_1 label="SUM(sp_ref_sub6)",
SUM(CONTENT9.pcp_ref_sub6) as pcp_ref1 label="SUM(pcp_ref_sub6)",
SUM(CONTENT9.pcp_ref_sub5) as pcp_ref6 label="SUM(pcp_ref_sub5)",
SUM(CONTENT9.sp_ref_sub5) as sp_ref_6 label="SUM(sp_ref_sub5)",
SUM(CONTENT9.sp_ref_sub4) as sp_ref_5 label="SUM(sp_ref_sub4)",
SUM(CONTENT9.pcp_ref_sub4) as pcp_ref5 label="SUM(pcp_ref_sub4)",
SUM(CONTENT9.sp_ref_sub3) as sp_ref_4 label="SUM(sp_ref_sub3)",
SUM(CONTENT9.pcp_ref_sub3) as pcp_ref4 label="SUM(pcp_ref_sub3)",
SUM(CONTENT9.sp_ref_sub2) as sp_ref_3 label="SUM(sp_ref_sub2)",
SUM(CONTENT9.pcp_ref_sub2) as pcp_ref3 label="SUM(pcp_ref_sub2)",
SUM(CONTENT9.sp_ref_sub1) as sp_ref_2 label="SUM(sp_ref_sub1)",
SUM(CONTENT9.pcp_ref_sub1) as pcp_ref2 label="SUM(pcp_ref_sub1)",
SUM(CONTENT9.sp_tests_sub19) as sp_test2 label="SUM(sp_tests_sub19)",
SUM(CONTENT9.pcp_tests_sub19) as pcp_tes2 label="SUM(pcp_tests_sub19)",
SUM(CONTENT9.sp_tests_sub18) as sp_te199 label="SUM(sp_tests_sub18)",
SUM(CONTENT9.pcp_tests_sub17) as pcp_t209 label="SUM(pcp_tests_sub17)",
SUM(CONTENT9.pcp_tests_sub16) as pcp_t119 label="SUM(pcp_tests_sub16)",
SUM(CONTENT9.sp_tests_sub14) as sp_te169 label="SUM(sp_tests_sub14)",
SUM(CONTENT9.sp_tests_sub12) as sp_te179 label="SUM(sp_tests_sub12)",
SUM(CONTENT9.sp_tests_sub11) as sp_te189 label="SUM(sp_tests_sub11)",
SUM(CONTENT9.sp_tests_sub10) as sp_test9 label="SUM(sp_tests_sub10)",
SUM(CONTENT9.pcp_tests_sub10) as pcp_t199 label="SUM(pcp_tests_sub10)",
SUM(CONTENT9.pcp_tests_sub9) as pcp_t189 label="SUM(pcp_tests_sub9)",
SUM(CONTENT9.sp_tests_sub8) as sp_te159 label="SUM(sp_tests_sub8)",
SUM(CONTENT9.pcp_tests_sub8) as pcp_t129 label="SUM(pcp_tests_sub8)",
SUM(CONTENT9.sp_tests_sub7) as sp_te149 label="SUM(sp_tests_sub7)",
SUM(CONTENT9.pcp_tests_sub7) as pcp_t149 label="SUM(pcp_tests_sub7)",
SUM(CONTENT9.sp_tests_sub6) as sp_te109 label="SUM(sp_tests_sub6)",
SUM(CONTENT9.pcp_tests_sub6) as pcp_t139 label="SUM(pcp_tests_sub6)",
SUM(CONTENT9.sp_tests_sub5) as sp_te119 label="SUM(sp_tests_sub5)",
SUM(CONTENT9.pcp_tests_sub5) as pcp_t159 label="SUM(pcp_tests_sub5)",
SUM(CONTENT9.sp_tests_sub4) as sp_te139 label="SUM(sp_tests_sub4)",
SUM(CONTENT9.pcp_tests_sub4) as pcp_t179 label="SUM(pcp_tests_sub4)",
SUM(CONTENT9.pcp_tests_sub3) as pcp_t169 label="SUM(pcp_tests_sub3)",
SUM(CONTENT9.sp_tests_sub3) as sp_te129 label="SUM(sp_tests_sub3)",
SUM(CONTENT9.sp_tests_sub2) as sp_test6 label="SUM(sp_tests_sub2)",
SUM(CONTENT9.pcp_tests_sub2) as pcp_tes6 label="SUM(pcp_tests_sub2)",
SUM(CONTENT9.sp_tests_sub1) as sp_test8 label="SUM(sp_tests_sub1)",
SUM(CONTENT9.pcp_tests_sub1) as pcp_tes7 label="SUM(pcp_tests_sub1)",
SUM(CONTENT9.sp_tests_sub9) as sp_test7 label="SUM(sp_tests_sub9)",
SUM(CONTENT9.pcp_tests_sub11) as pcp_tes8 label="SUM(pcp_tests_sub11)",
SUM(CONTENT9.pcp_tests_sub12) as pcp_t109 label="SUM(pcp_tests_sub12)",
SUM(CONTENT9.pcp_tests_sub14) as pcp_tes9 label="SUM(pcp_tests_sub14)",
SUM(CONTENT9.sp_tests_sub13) as sp_test5 label="SUM(sp_tests_sub13)",
SUM(CONTENT9.pcp_tests_sub13) as pcp_tes4 label="SUM(pcp_tests_sub13)",
SUM(CONTENT9.pcp_tests_sub15) as pcp_tes5 label="SUM(pcp_tests_sub15)",
SUM(CONTENT9.sp_tests_sub15) as sp_test4 label="SUM(sp_tests_sub15)",
SUM(CONTENT9.sp_tests_sub16) as sp_test3 label="SUM(sp_tests_sub16)",
SUM(CONTENT9.pcp_tests_sub18) as pcp_tes3 label="SUM(pcp_tests_sub18)",
SUM(CONTENT9.sp_tests_sub17) as sp_te209 label="SUM(sp_tests_sub17)",
SUM(CONTENT9.sp_meds_sub11) as sp_meds2 label="SUM(sp_meds_sub11)",
SUM(CONTENT9.pcp_meds_sub11) as pcp_m229 label="SUM(pcp_meds_sub11)",
SUM(CONTENT9.sp_meds_sub10) as sp_meds3 label="SUM(sp_meds_sub10)",
SUM(CONTENT9.pcp_meds_sub10) as pcp_m219 label="SUM(pcp_meds_sub10)",
SUM(CONTENT9.sp_meds_sub9) as sp_meds4 label="SUM(sp_meds_sub9)",
SUM(CONTENT9.pcp_meds_sub9) as pcp_m239 label="SUM(pcp_meds_sub9)",
SUM(CONTENT9.sp_meds_sub8) as sp_meds5 label="SUM(sp_meds_sub8)",
SUM(CONTENT9.pcp_meds_sub8) as pcp_m249 label="SUM(pcp_meds_sub8)",
SUM(CONTENT9.sp_meds_sub7) as sp_meds6 label="SUM(sp_meds_sub7)",
SUM(CONTENT9.pcp_meds_sub7) as pcp_m259 label="SUM(pcp_meds_sub7)",
SUM(CONTENT9.sp_meds_sub6) as sp_meds7 label="SUM(sp_meds_sub6)",
SUM(CONTENT9.pcp_meds_sub6) as pcp_m269 label="SUM(pcp_meds_sub6)",
SUM(CONTENT9.sp_meds_sub5) as sp_meds8 label="SUM(sp_meds_sub5)",
SUM(CONTENT9.pcp_meds_sub5) as pcp_m209 label="SUM(pcp_meds_sub5)",
SUM(CONTENT9.sp_meds_sub3) as sp_meds9 label="SUM(sp_meds_sub3)",
SUM(CONTENT9.pcp_meds_sub4) as pcp_m279 label="SUM(pcp_meds_sub4)",
SUM(CONTENT9.sp_meds_sub4) as sp_me189 label="SUM(sp_meds_sub4)",
SUM(CONTENT9.pcp_meds_sub3) as pcp_m199 label="SUM(pcp_meds_sub3)",
SUM(CONTENT9.sp_meds_sub2) as sp_me199 label="SUM(sp_meds_sub2)",
SUM(CONTENT9.pcp_meds_sub2) as pcp_m189 label="SUM(pcp_meds_sub2)",
SUM(CONTENT9.sp_meds_sub1) as sp_meds1 label="SUM(sp_meds_sub1)",
SUM(CONTENT9.pcp_meds_sub1) as pcp_m289 label="SUM(pcp_meds_sub1)",
SUM(CONTENT9.sp_othertx_sub8) as sp_othe2 label="SUM(sp_othertx_sub8)",
SUM(CONTENT9.pcp_othertx_sub8) as pcp_oth2 label="SUM(pcp_othertx_sub8)",
SUM(CONTENT9.pcp_othertx_sub7) as pcp_oth8 label="SUM(pcp_othertx_sub7)",
SUM(CONTENT9.sp_othertx_sub7) as sp_othe3 label="SUM(sp_othertx_sub7)",
SUM(CONTENT9.sp_othertx_sub6) as sp_othe9 label="SUM(sp_othertx_sub6)",
SUM(CONTENT9.pcp_othertx_sub6) as pcp_oth9 label="SUM(pcp_othertx_sub6)",
SUM(CONTENT9.sp_othertx_sub5) as sp_othe4 label="SUM(sp_othertx_sub5)",
SUM(CONTENT9.pcp_othertx_sub5) as pcp_oth3 label="SUM(pcp_othertx_sub5)",
SUM(CONTENT9.sp_othertx_sub4) as sp_othe8 label="SUM(sp_othertx_sub4)",
SUM(CONTENT9.pcp_othertx_sub4) as pcp_oth7 label="SUM(pcp_othertx_sub4)",
SUM(CONTENT9.sp_othertx_sub3) as sp_othe5 label="SUM(sp_othertx_sub3)",
SUM(CONTENT9.pcp_othertx_sub3) as pcp_oth6 label="SUM(pcp_othertx_sub3)",
SUM(CONTENT9.sp_othertx_sub2) as sp_othe6 label="SUM(sp_othertx_sub2)",
SUM(CONTENT9.pcp_othertx_sub2) as pcp_oth5 label="SUM(pcp_othertx_sub2)",
SUM(CONTENT9.pcp_othertx_sub1) as pcp_oth4 label="SUM(pcp_othertx_sub1)",
SUM(CONTENT9.sp_othertx_sub1) as sp_othe7 label="SUM(sp_othertx_sub1)",
SUM(CONTENT9.sp_emot_sub6) as sp_emot4 label="SUM(sp_emot_sub6)",
SUM(CONTENT9.pcp_emot_sub6) as pcp_emo3 label="SUM(pcp_emot_sub6)",
SUM(CONTENT9.sp_emot_sub5) as sp_emot3 label="SUM(sp_emot_sub5)",
SUM(CONTENT9.pcp_emot_sub5) as pcp_emo4 label="SUM(pcp_emot_sub5)",
SUM(CONTENT9.sp_emot_sub4) as sp_emot2 label="SUM(sp_emot_sub4)",
SUM(CONTENT9.sp_emot_sub3) as sp_emot5 label="SUM(sp_emot_sub3)",
SUM(CONTENT9.pcp_emot_sub4) as pcp_emo2 label="SUM(pcp_emot_sub4)",
SUM(CONTENT9.pcp_emot_sub3) as pcp_emo5 label="SUM(pcp_emot_sub3)",
SUM(CONTENT9.sp_emot_sub2) as sp_emot6 label="SUM(sp_emot_sub2)",
SUM(CONTENT9.pcp_emot_sub2) as pcp_emo6 label="SUM(pcp_emot_sub2)",
SUM(CONTENT9.sp_emot_sub1) as sp_emot1 label="SUM(sp_emot_sub1)",
SUM(CONTENT9.pcp_emot_sub1) as pcp_emo7 label="SUM(pcp_emot_sub1)",
SUM(CONTENT9.sp_social_sub8) as sp_soci7 label="SUM(sp_social_sub8)",
SUM(CONTENT9.sp_social_sub7) as sp_soci8 label="SUM(sp_social_sub7)",
SUM(CONTENT9.pcp_social_sub8) as pcp_soc3 label="SUM(pcp_social_sub8)",
SUM(CONTENT9.sp_social_sub6) as sp_soci6 label="SUM(sp_social_sub6)",
SUM(CONTENT9.pcp_social_sub7) as pcp_soc7 label="SUM(pcp_social_sub7)",
SUM(CONTENT9.pcp_social_sub6) as pcp_soc6 label="SUM(pcp_social_sub6)",
SUM(CONTENT9.sp_social_sub5) as sp_soci5 label="SUM(sp_social_sub5)",
SUM(CONTENT9.pcp_social_sub5) as pcp_soc5 label="SUM(pcp_social_sub5)",
SUM(CONTENT9.sp_social_sub4) as sp_soci4 label="SUM(sp_social_sub4)",
SUM(CONTENT9.pcp_social_sub4) as pcp_soc4 label="SUM(pcp_social_sub4)",
SUM(CONTENT9.sp_social_sub3) as sp_soci3 label="SUM(sp_social_sub3)",
SUM(CONTENT9.pcp_social_sub3) as pcp_soc8 label="SUM(pcp_social_sub3)",
SUM(CONTENT9.sp_social_sub2) as sp_soci9 label="SUM(sp_social_sub2)",
SUM(CONTENT9.pcp_social_sub2) as pcp_soc2 label="SUM(pcp_social_sub2)",
SUM(CONTENT9.sp_social_sub1) as sp_soci2 label="SUM(sp_social_sub1)",
SUM(CONTENT9.pcp_social_sub1) as pcp_soc9 label="SUM(pcp_social_sub1)",
SUM(CONTENT9.sp_closing_sub18) as sp_cl109 label="SUM(sp_closing_sub18)",
SUM(CONTENT9.pcp_closing_sub18) as pcp_clo9 label="SUM(pcp_closing_sub18)",
SUM(CONTENT9.sp_closing_sub17) as sp_clos4 label="SUM(sp_closing_sub17)",
SUM(CONTENT9.pcp_closing_sub17) as pcp_clo8 label="SUM(pcp_closing_sub17)",
SUM(CONTENT9.pcp_closing_sub16) as pcp_clo7 label="SUM(pcp_closing_sub16)",
SUM(CONTENT9.sp_closing_sub16) as sp_clos5 label="SUM(sp_closing_sub16)",
SUM(CONTENT9.sp_closing_sub15) as sp_clos9 label="SUM(sp_closing_sub15)",
SUM(CONTENT9.pcp_closing_sub15) as pcp_clo3 label="SUM(pcp_closing_sub15)",
SUM(CONTENT9.pcp_closing_sub14) as pcp_clo6 label="SUM(pcp_closing_sub14)",
SUM(CONTENT9.sp_closing_sub14) as sp_clos8 label="SUM(sp_closing_sub14)",
SUM(CONTENT9.sp_closing_sub13) as sp_clos6 label="SUM(sp_closing_sub13)",
SUM(CONTENT9.pcp_closing_sub13) as pcp_clo5 label="SUM(pcp_closing_sub13)",
SUM(CONTENT9.pcp_closing_sub12) as pcp_clo4 label="SUM(pcp_closing_sub12)",
SUM(CONTENT9.sp_closing_sub12) as sp_clos7 label="SUM(sp_closing_sub12)",
SUM(CONTENT9.sp_closing_sub11) as sp_clos2 label="SUM(sp_closing_sub11)",
SUM(CONTENT9.pcp_closing_sub11) as pcp_clo2 label="SUM(pcp_closing_sub11)",
SUM(CONTENT9.sp_closing_sub10) as sp_clos3 label="SUM(sp_closing_sub10)",
SUM(CONTENT9.pcp_closing_sub10) as pcp_c129 label="SUM(pcp_closing_sub10)",
SUM(CONTENT9.sp_closing_sub9) as sp_cl129 label="SUM(sp_closing_sub9)",
SUM(CONTENT9.pcp_closing_sub9) as pcp_c119 label="SUM(pcp_closing_sub9)",
SUM(CONTENT9.sp_closing_sub8) as sp_cl139 label="SUM(sp_closing_sub8)",
SUM(CONTENT9.pcp_closing_sub8) as pcp_c139 label="SUM(pcp_closing_sub8)",
SUM(CONTENT9.sp_closing_sub7) as sp_cl159 label="SUM(sp_closing_sub7)",
SUM(CONTENT9.sp_closing_sub6) as sp_cl149 label="SUM(sp_closing_sub6)",
SUM(CONTENT9.pcp_closing_sub7) as pcp_c149 label="SUM(pcp_closing_sub7)",
SUM(CONTENT9.pcp_closing_sub6) as pcp_c159 label="SUM(pcp_closing_sub6)",
SUM(CONTENT9.sp_closing_sub5) as sp_cl119 label="SUM(sp_closing_sub5)",
SUM(CONTENT9.pcp_closing_sub5) as pcp_c189 label="SUM(pcp_closing_sub5)",
SUM(CONTENT9.sp_closing_sub4) as sp_cl199 label="SUM(sp_closing_sub4)",
SUM(CONTENT9.pcp_closing_sub4) as pcp_c179 label="SUM(pcp_closing_sub4)",
SUM(CONTENT9.sp_closing_sub3) as sp_cl189 label="SUM(sp_closing_sub3)",
SUM(CONTENT9.pcp_closing_sub3) as pcp_c169 label="SUM(pcp_closing_sub3)",
SUM(CONTENT9.sp_closing_sub2) as sp_cl179 label="SUM(sp_closing_sub2)",
SUM(CONTENT9.sp_closing_sub1) as sp_cl169 label="SUM(sp_closing_sub1)",
SUM(CONTENT9.pcp_closing_sub2) as pcp_c109 label="SUM(pcp_closing_sub2)",
SUM(CONTENT9.pcp_closing_sub1) as pcp_c199 label="SUM(pcp_closing_sub1)",
SUM(CONTENT9.pcp_unint_sub1) as pcp_uni2 label="SUM(pcp_unint_sub1)",
SUM(CONTENT9.sp_unint_sub1) as sp_unin3 label="SUM(sp_unint_sub1)",
SUM(CONTENT9.sp_unint_sub2) as sp_unin2 label="SUM(sp_unint_sub2)",
SUM(CONTENT9.pcp_unint_sub2) as pcp_uni3 label="SUM(pcp_unint_sub2)",
SUM(CONTENT9.pcp_bckch_sub1) as pcp_bck5 label="SUM(pcp_bckch_sub1)",
SUM(CONTENT9.sp_bckch_sub1) as sp_bckc5 label="SUM(sp_bckch_sub1)",
SUM(CONTENT9.pcp_bckch_sub2) as pcp_bck4 label="SUM(pcp_bckch_sub2)",
SUM(CONTENT9.pcp_bckch_sub3) as pcp_bck3 label="SUM(pcp_bckch_sub3)",
SUM(CONTENT9.sp_bckch_sub2) as sp_bckc3 label="SUM(sp_bckch_sub2)",
SUM(CONTENT9.sp_bckch_sub3) as sp_bckc4 label="SUM(sp_bckch_sub3)",
SUM(CONTENT9.pcp_bckch_sub4) as pcp_bck2 label="SUM(pcp_bckch_sub4)",
SUM(CONTENT9.sp_bckch_sub4) as sp_bckc2 label="SUM(sp_bckch_sub4)"
from WORK.CONTENT9
group by CONTENT9.case_id;


data work.content10;
   set work.content7;
run;

data work.communication1;
   set work.communication;
run;

proc sort data = work.content10;
   by content_id;
run;

proc sort data = work.communication1;
   by content_id;
run;

data work.content11;
   merge work.content10 work.communication1;
   by content_id;
run;

proc sort data = work.content11;
   by case_id;
run;

data work.content12 (drop = is_deleted is_selected communication_type_id);
   set work.content11;
run;

data work.content13;
   set work.content12;
   if open_question = 1 & speaker_type = 'HCP' THEN pcp_openq = 1;
   if open_question = 1 & speaker_type = 'SP' THEN sp_openq = 1;
run;

data work.content14 (rename= (description = communication_type value = text));
   set work.content13;
   label description = communication_type;
   label value = text;
run;

proc sort data = work.decision;
   by decision_desc_id;
run;

proc sort data = work.decision_desc;
   by decision_desc_id;
run;

data work.content_desc;
   merge work.decision work.decision_desc;
   by decision_desc_id;
run;

proc sort data = work.content14;
   by content_id;
run;

proc sort data = work.content_desc;
   by content_id;
run;

data work.content_comm_desc;
   merge work.content14 work.content_desc;
   by content_id;
run;

data work.content_comm_desc_merge (rename = (description = decision) drop = pcp_openq sp_openq decision_id decision_desc_id decision_type_id display_order
transcript_pos transcript_len included_in_study template_id );
   set work.content_comm_desc;
   label content_id = Content ID;
   label case_id = Case ID;
   label speaker_id = Speaker ID;
   label statement_type = Statement Type;
   label content_order = Content Order;
   label transcript_text = Transcription Text;
   label topic = Topic;
   label subtopic = Subtopic;
   label speaker_desc = Speaker Description;
   label speaker_type = Speaker Type;
   label communication_type = Communication Type;
   label text = Text for Communication type;
   label description = Decision;
   if case_id ^= .;
   if content_order ^= .;
   by content_order;
run;

data work.CONTENT15;
   set work.content14;
   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Argument' THEN pcp_int_arg = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Argument' THEN sp_int_arg = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Argument' THEN pcp_medhist_arg = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Argument' THEN sp_medhist_arg = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Argument' THEN pcp_gimedhist_arg = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Argument' THEN sp_gimedhist_arg = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Argument' THEN pcp_fammedhist_arg = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Argument' THEN sp_fammedhist_arg = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Argument' THEN pcp_hlthbeh_arg = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Argument' THEN sp_hlthbeh_arg = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Argument' THEN pcp_pyschinfo_arg = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Argument' THEN sp_pyschinfo_arg = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Argument' THEN pcp_physexam_arg = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Argument' THEN sp_physexam_arg = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Argument' THEN pcp_sympt_arg = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Argument' THEN sp_sympt_arg = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Argument' THEN pcp_oript_arg = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Argument' THEN sp_oript_arg = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Argument' THEN pcp_fin_arg = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Argument' THEN sp_fin_arg = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Argument' THEN pcp_possdiag_arg = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Argument' THEN sp_possdiag_arg = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Argument' THEN pcp_ref_arg = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Argument' THEN sp_ref_arg = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Argument' THEN pcp_tests_arg = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Argument' THEN sp_tests_arg = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Argument' THEN pcp_med_arg = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Argument' THEN sp_med_arg = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Argument' THEN pcp_othertx_arg = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Argument' THEN sp_othertx_arg = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Argument' THEN pcp_emot_arg = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Argument' THEN sp_emot_arg = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Argument' THEN pcp_social_arg = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Argument' THEN sp_social_arg = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Argument' THEN pcp_closing_arg = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Argument' THEN sp_closing_arg = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Argument' THEN pcp_unint_arg = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Argument' THEN sp_unint_arg = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Argument' THEN pcp_bckch_arg = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Argument' THEN sp_bckch_arg = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Refutation' THEN pcp_int_refut = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Refutation' THEN sp_int_refut = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Refutation' THEN pcp_medhist_refut = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Refutation' THEN sp_medhist_refut = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Refutation' THEN pcp_gimedhist_refut = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Refutation' THEN sp_gimedhist_refut = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Refutation' THEN pcp_fammedhist_refut = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Refutation' THEN sp_fammedhist_refut = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Refutation' THEN pcp_hlthbeh_refut = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Refutation' THEN sp_hlthbeh_refut = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Refutation' THEN pcp_pyschinfo_refut = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Refutation' THEN sp_pyschinfo_refut = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Refutation' THEN pcp_physexam_refut = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Refutation' THEN sp_physexam_refut = 1;
   if speaker_type = 'HCP' & topic = 'Symspoms' & communication_type = 'Refutation' THEN pcp_sympt_refut = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Refutation' THEN sp_sympt_refut = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Refutation' THEN pcp_oript_refut = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Refutation' THEN sp_oript_refut = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Refutation' THEN pcp_fin_refut = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Refutation' THEN sp_fin_refut = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Refutation' THEN pcp_possdiag_refut = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Refutation' THEN sp_possdiag_refut = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Refutation' THEN pcp_ref_refut = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Refutation' THEN sp_ref_refut = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Refutation' THEN pcp_tests_refut = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Refutation' THEN sp_tests_refut = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Refutation' THEN pcp_med_refut = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Refutation' THEN sp_med_refut = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Refutation' THEN pcp_othertx_refut = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Refutation' THEN sp_othertx_refut = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Refutation' THEN pcp_emot_refut = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Refutation' THEN sp_emot_refut = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Refutation' THEN pcp_social_refut = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Refutation' THEN sp_social_refut = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Refutation' THEN pcp_closing_refut = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Refutation' THEN sp_closing_refut = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Refutation' THEN pcp_unint_refut = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Refutation' THEN sp_unint_refut = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Refutation' THEN pcp_bckch_refut = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Refutation' THEN sp_bckch_refut = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Altruism' THEN pcp_int_altru = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Altruism' THEN sp_int_altru = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Altruism' THEN pcp_medhist_altru = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Altruism' THEN sp_medhist_altru = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Altruism' THEN pcp_gimedhist_altru = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Altruism' THEN sp_gimedhist_altru = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Altruism' THEN pcp_fammedhist_altru = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Altruism' THEN sp_fammedhist_altru = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Altruism' THEN pcp_hlthbeh_altru = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Altruism' THEN sp_hlthbeh_altru = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Altruism' THEN pcp_pyschinfo_altru = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Altruism' THEN sp_pyschinfo_altru = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Altruism' THEN pcp_physexam_altru = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Altruism' THEN sp_physexam_altru = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Altruism' THEN pcp_sympt_altru = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Altruism' THEN sp_sympt_altru = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Altruism' THEN pcp_oript_altru = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Altruism' THEN sp_oript_altru = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Altruism' THEN pcp_fin_altru = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Altruism' THEN sp_fin_altru = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Altruism' THEN pcp_possdiag_altru = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Altruism' THEN sp_possdiag_altru = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Altruism' THEN pcp_ref_altru = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Altruism' THEN sp_ref_altru = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Altruism' THEN pcp_tests_altru = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Altruism' THEN sp_tests_altru = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Altruism' THEN pcp_med_altru = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Altruism' THEN sp_med_altru = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Altruism' THEN pcp_othertx_altru = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Altruism' THEN sp_othertx_altru = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Altruism' THEN pcp_emot_altru = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Altruism' THEN sp_emot_altru = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Altruism' THEN pcp_social_altru = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Altruism' THEN sp_social_altru = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Altruism' THEN pcp_closing_altru = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Altruism' THEN sp_closing_altru = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Altruism' THEN pcp_unint_altru = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Altruism' THEN sp_unint_altru = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Altruism' THEN pcp_bckch_altru = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Altruism' THEN sp_bckch_altru = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Esteem' THEN pcp_int_esteem = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Esteem' THEN sp_int_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Esteem' THEN pcp_medhist_esteem = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Esteem' THEN sp_medhist_esteem = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Esteem' THEN pcp_gimedhist_esteem = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Esteem' THEN sp_gimedhist_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Esteem' THEN pcp_fammedhist_esteem = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Esteem' THEN sp_fammedhist_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Esteem' THEN pcp_hlthbeh_esteem = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Esteem' THEN sp_hlthbeh_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Esteem' THEN pcp_pyschinfo_esteem = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Esteem' THEN sp_pyschinfo_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Esteem' THEN pcp_physexam_esteem = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Esteem' THEN sp_physexam_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Esteem' THEN pcp_sympt_esteem = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Esteem' THEN sp_sympt_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Esteem' THEN pcp_oript_esteem = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Esteem' THEN sp_oript_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Esteem' THEN pcp_fin_esteem = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Esteem' THEN sp_fin_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Esteem' THEN pcp_possdiag_esteem = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Esteem' THEN sp_possdiag_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Esteem' THEN pcp_ref_esteem = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Esteem' THEN sp_ref_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Esteem' THEN pcp_tests_esteem = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Esteem' THEN sp_tests_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Esteem' THEN pcp_med_esteem = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Esteem' THEN sp_med_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Esteem' THEN pcp_othertx_esteem = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Esteem' THEN sp_othertx_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Esteem' THEN pcp_emot_esteem = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Esteem' THEN sp_emot_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Esteem' THEN pcp_social_esteem = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Esteem' THEN sp_social_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Esteem' THEN pcp_closing_esteem = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Esteem' THEN sp_closing_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Esteem' THEN pcp_unint_esteem = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Esteem' THEN sp_unint_esteem = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Esteem' THEN pcp_bckch_esteem = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Esteem' THEN sp_bckch_esteem = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Guilt/Debt' THEN pcp_int_guilt = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Guilt/Debt' THEN sp_int_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Guilt/Debt' THEN pcp_medhist_guilt = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Guilt/Debt' THEN sp_medhist_guilt = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Guilt/Debt' THEN pcp_gimedhist_guilt = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Guilt/Debt' THEN sp_gimedhist_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Guilt/Debt' THEN pcp_fammedhist_guilt = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Guilt/Debt' THEN sp_fammedhist_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Guilt/Debt' THEN pcp_hlthbeh_guilt = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Guilt/Debt' THEN sp_hlthbeh_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Guilt/Debt' THEN pcp_pyschinfo_guilt = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Guilt/Debt' THEN sp_pyschinfo_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Guilt/Debt' THEN pcp_physexam_guilt = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Guilt/Debt' THEN sp_physexam_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Guilt/Debt' THEN pcp_sympt_guilt = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Guilt/Debt' THEN sp_sympt_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Guilt/Debt' THEN pcp_oript_guilt = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Guilt/Debt' THEN sp_oript_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Guilt/Debt' THEN pcp_fin_guilt = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Guilt/Debt' THEN sp_fin_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Guilt/Debt' THEN pcp_possdiag_guilt = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Guilt/Debt' THEN sp_possdiag_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Guilt/Debt' THEN pcp_ref_guilt = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Guilt/Debt' THEN sp_ref_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Guilt/Debt' THEN pcp_tests_guilt = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Guilt/Debt' THEN sp_tests_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Guilt/Debt' THEN pcp_med_guilt = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Guilt/Debt' THEN sp_med_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Guilt/Debt' THEN pcp_othertx_guilt = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Guilt/Debt' THEN sp_othertx_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Guilt/Debt' THEN pcp_emot_guilt = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Guilt/Debt' THEN sp_emot_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Guilt/Debt' THEN pcp_social_guilt = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Guilt/Debt' THEN sp_social_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Guilt/Debt' THEN pcp_closing_guilt = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Guilt/Debt' THEN sp_closing_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Guilt/Debt' THEN pcp_unint_guilt = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Guilt/Debt' THEN sp_unint_guilt = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Guilt/Debt' THEN pcp_bckch_guilt = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Guilt/Debt' THEN sp_bckch_guilt = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Foot in the door' THEN pcp_int_foot = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Foot in the door' THEN sp_int_foot = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Foot in the door' THEN pcp_medhist_foot = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Foot in the door' THEN sp_medhist_foot = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Foot in the door' THEN pcp_gimedhist_foot = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Foot in the door' THEN sp_gimedhist_foot = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Foot in the door' THEN pcp_fammedhist_foot = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Foot in the door' THEN sp_fammedhist_foot = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Foot in the door' THEN pcp_hlthbeh_foot = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Foot in the door' THEN sp_hlthbeh_foot = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Foot in the door' THEN pcp_pyschinfo_foot = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Foot in the door' THEN sp_pyschinfo_foot = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Foot in the door' THEN pcp_physexam_foot = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Foot in the door' THEN sp_physexam_foot = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Foot in the door' THEN pcp_sympt_foot = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Foot in the door' THEN sp_sympt_foot = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Foot in the door' THEN pcp_oript_foot = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Foot in the door' THEN sp_oript_foot = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Foot in the door' THEN pcp_fin_foot = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Foot in the door' THEN sp_fin_foot = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Foot in the door' THEN pcp_possdiag_foot = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Foot in the door' THEN sp_possdiag_foot = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Foot in the door' THEN pcp_ref_foot = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Foot in the door' THEN sp_ref_foot = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Foot in the door' THEN pcp_tests_foot = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Foot in the door' THEN sp_tests_foot = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Foot in the door' THEN pcp_med_foot = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Foot in the door' THEN sp_med_foot = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Foot in the door' THEN pcp_othertx_foot = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Foot in the door' THEN sp_othertx_foot = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Foot in the door' THEN pcp_emot_foot = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Foot in the door' THEN sp_emot_foot = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Foot in the door' THEN pcp_social_foot = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Foot in the door' THEN sp_social_foot = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Foot in the door' THEN pcp_closing_foot = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Foot in the door' THEN sp_closing_foot = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Foot in the door' THEN pcp_unint_foot = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Foot in the door' THEN sp_unint_foot = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Foot in the door' THEN pcp_bckch_foot = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Foot in the door' THEN sp_bckch_foot = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Threat' THEN pcp_int_threat = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Threat' THEN sp_int_threat = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Threat' THEN pcp_medhist_threat = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Threat' THEN sp_medhist_threat = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Threat' THEN pcp_gimedhist_threat = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Threat' THEN sp_gimedhist_threat = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Threat' THEN pcp_fammedhist_threat = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Threat' THEN sp_fammedhist_threat = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Threat' THEN pcp_hlthbeh_threat = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Threat' THEN sp_hlthbeh_threat = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Threat' THEN pcp_pyschinfo_threat = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Threat' THEN sp_pyschinfo_threat = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Threat' THEN pcp_physexam_threat = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Threat' THEN sp_physexam_threat = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Threat' THEN pcp_sympt_threat = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Threat' THEN sp_sympt_threat = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Threat' THEN pcp_oript_threat = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Threat' THEN sp_oript_threat = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Threat' THEN pcp_fin_threat = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Threat' THEN sp_fin_threat = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Threat' THEN pcp_possdiag_threat = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Threat' THEN sp_possdiag_threat = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Threat' THEN pcp_ref_threat = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Threat' THEN sp_ref_threat = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Threat' THEN pcp_tests_threat = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Threat' THEN sp_tests_threat = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Threat' THEN pcp_med_threat = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Threat' THEN sp_med_threat = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Threat' THEN pcp_othertx_threat = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Threat' THEN sp_othertx_threat = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Threat' THEN pcp_emot_threat = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Threat' THEN sp_emot_threat = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Threat' THEN pcp_social_threat = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Threat' THEN sp_social_threat = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Threat' THEN pcp_closing_threat = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Threat' THEN sp_closing_threat = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Threat' THEN pcp_unint_threat = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Threat' THEN sp_unint_threat = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Threat' THEN pcp_bckch_threat = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Threat' THEN sp_bckch_threat = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Emphasis' THEN pcp_int_emph = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Emphasis' THEN sp_int_emph = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Emphasis' THEN pcp_medhist_emph = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Emphasis' THEN sp_medhist_emph = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Emphasis' THEN pcp_gimedhist_emph = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Emphasis' THEN sp_gimedhist_emph = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Emphasis' THEN pcp_fammedhist_emph = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Emphasis' THEN sp_fammedhist_emph = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Emphasis' THEN pcp_hlthbeh_emph = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Emphasis' THEN sp_hlthbeh_emph = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Emphasis' THEN pcp_pyschinfo_emph = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Emphasis' THEN sp_pyschinfo_emph = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Emphasis' THEN pcp_physexam_emph = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Emphasis' THEN sp_physexam_emph = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Emphasis' THEN pcp_sympt_emph = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Emphasis' THEN sp_sympt_emph = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Emphasis' THEN pcp_oript_emph = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Emphasis' THEN sp_oript_emph = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Emphasis' THEN pcp_fin_emph = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Emphasis' THEN sp_fin_emph = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Emphasis' THEN pcp_possdiag_emph = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Emphasis' THEN sp_possdiag_emph = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Emphasis' THEN pcp_ref_emph = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Emphasis' THEN sp_ref_emph = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Emphasis' THEN pcp_tests_emph = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Emphasis' THEN sp_tests_emph = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Emphasis' THEN pcp_med_emph = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Emphasis' THEN sp_med_emph = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Emphasis' THEN pcp_othertx_emph = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Emphasis' THEN sp_othertx_emph = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Emphasis' THEN pcp_emot_emph = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Emphasis' THEN sp_emot_emph = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Emphasis' THEN pcp_social_emph = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Emphasis' THEN sp_social_emph = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Emphasis' THEN pcp_closing_emph = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Emphasis' THEN sp_closing_emph = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Emphasis' THEN pcp_unint_emph = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Emphasis' THEN sp_unint_emph = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Emphasis' THEN pcp_bckch_emph = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Emphasis' THEN sp_bckch_emph = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Approval' THEN pcp_int_approval = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Approval' THEN sp_int_approval = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Approval' THEN pcp_medhist_approval = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Approval' THEN sp_medhist_approval = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Approval' THEN pcp_gimedhist_approval = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Approval' THEN sp_gimedhist_approval = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Approval' THEN pcp_fammedhist_approval = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Approval' THEN sp_fammedhist_approval = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Approval' THEN pcp_hlthbeh_approval = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Approval' THEN sp_hlthbeh_approval = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Approval' THEN pcp_pyschinfo_approval = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Approval' THEN sp_pyschinfo_approval = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Approval' THEN pcp_physexam_approval = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Approval' THEN sp_physexam_approval = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Approval' THEN pcp_sympt_approval = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Approval' THEN sp_sympt_approval = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Approval' THEN pcp_oript_approval = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Approval' THEN sp_oript_approval = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Approval' THEN pcp_fin_approval = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Approval' THEN sp_fin_approval = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Approval' THEN pcp_possdiag_approval = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Approval' THEN sp_possdiag_approval = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Approval' THEN pcp_ref_approval = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Approval' THEN sp_ref_approval = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Approval' THEN pcp_tests_approval = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Approval' THEN sp_tests_approval = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Approval' THEN pcp_med_approval = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Approval' THEN sp_med_approval = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Approval' THEN pcp_othertx_approval = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Approval' THEN sp_othertx_approval = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Approval' THEN pcp_emot_approval = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Approval' THEN sp_emot_approval = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Approval' THEN pcp_social_approval = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Approval' THEN sp_social_approval = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Approval' THEN pcp_closing_approval = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Approval' THEN sp_closing_approval = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Approval' THEN pcp_unint_approval = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Approval' THEN sp_unint_approval = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Approval' THEN pcp_bckch_approval = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Approval' THEN sp_bckch_approval = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Repetition/Clarification' THEN pcp_int_repeat = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Repetition/Clarification' THEN sp_int_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Repetition/Clarification' THEN pcp_medhist_repeat = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Repetition/Clarification' THEN sp_medhist_repeat = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Repetition/Clarification' THEN pcp_gimedhist_repeat = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Repetition/Clarification' THEN sp_gimedhist_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Repetition/Clarification' THEN pcp_fammedhist_repeat = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Repetition/Clarification' THEN sp_fammedhist_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Repetition/Clarification' THEN pcp_hlthbeh_repeat = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Repetition/Clarification' THEN sp_hlthbeh_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Repetition/Clarification' THEN pcp_pyschinfo_repeat = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Repetition/Clarification' THEN sp_pyschinfo_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Repetition/Clarification' THEN pcp_physexam_repeat = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Repetition/Clarification' THEN sp_physexam_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Repetition/Clarification' THEN pcp_sympt_repeat = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Repetition/Clarification' THEN sp_sympt_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Repetition/Clarification' THEN pcp_oript_repeat = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Repetition/Clarification' THEN sp_oript_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Repetition/Clarification' THEN pcp_fin_repeat = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Repetition/Clarification' THEN sp_fin_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Repetition/Clarification' THEN pcp_possdiag_repeat = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Repetition/Clarification' THEN sp_possdiag_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Repetition/Clarification' THEN pcp_ref_repeat = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Repetition/Clarification' THEN sp_ref_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Repetition/Clarification' THEN pcp_tests_repeat = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Repetition/Clarification' THEN sp_tests_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Repetition/Clarification' THEN pcp_med_repeat = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Repetition/Clarification' THEN sp_med_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Repetition/Clarification' THEN pcp_othertx_repeat = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Repetition/Clarification' THEN sp_othertx_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Repetition/Clarification' THEN pcp_emot_repeat = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Repetition/Clarification' THEN sp_emot_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Repetition/Clarification' THEN pcp_social_repeat = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Repetition/Clarification' THEN sp_social_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Repetition/Clarification' THEN pcp_closing_repeat = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Repetition/Clarification' THEN sp_closing_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Repetition/Clarification' THEN pcp_unint_repeat = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Repetition/Clarification' THEN sp_unint_repeat = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Repetition/Clarification' THEN pcp_bckch_repeat = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Argument' THEN sp_bckch_repeat = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Offer of Service' THEN pcp_int_offer = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Offer of Service' THEN sp_int_offer = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Offer of Service' THEN pcp_medhist_offer = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Offer of Service' THEN sp_medhist_offer = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Offer of Service' THEN pcp_gimedhist_offer = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Offer of Service' THEN sp_gimedhist_offer = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Offer of Service' THEN pcp_fammedhist_offer = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Offer of Service' THEN sp_fammedhist_offer = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Offer of Service' THEN pcp_hlthbeh_offer = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Offer of Service' THEN sp_hlthbeh_offer = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Offer of Service' THEN pcp_pyschinfo_offer = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Offer of Service' THEN sp_pyschinfo_offer = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Offer of Service' THEN pcp_physexam_offer = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Offer of Service' THEN sp_physexam_offer = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Offer of Service' THEN pcp_sympt_offer = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Offer of Service' THEN sp_sympt_offer = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Offer of Service' THEN pcp_oript_offer = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Offer of Service' THEN sp_oript_offer = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Offer of Service' THEN pcp_fin_offer = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Offer of Service' THEN sp_fin_offer = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Offer of Service' THEN pcp_possdiag_offer = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Offer of Service' THEN sp_possdiag_offer = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Offer of Service' THEN pcp_ref_offer = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Offer of Service' THEN sp_ref_offer = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Offer of Service' THEN pcp_tests_offer = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Offer of Service' THEN sp_tests_offer = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Offer of Service' THEN pcp_med_offer = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Offer of Service' THEN sp_med_offer = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Offer of Service' THEN pcp_othertx_offer = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Offer of Service' THEN sp_othertx_offer = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Offer of Service' THEN pcp_emot_offer = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Offer of Service' THEN sp_emot_offer = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Offer of Service' THEN pcp_social_offer = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Offer of Service' THEN sp_social_offer = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Offer of Service' THEN pcp_closing_offer = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Offer of Service' THEN sp_closing_offer = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Offer of Service' THEN pcp_unint_offer = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Offer of Service' THEN sp_unint_offer = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Offer of Service' THEN pcp_bckch_offer = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Offer of Service' THEN sp_bckch_offer = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Concern/Empathy' THEN pcp_int_concern = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Concern/Empathy' THEN sp_int_concern = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Concern/Empathy' THEN pcp_medhist_concern = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Concern/Empathy' THEN sp_medhist_concern = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Concern/Empathy' THEN pcp_gimedhist_concern = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Concern/Empathy' THEN sp_gimedhist_concern = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Concern/Empathy' THEN pcp_fammedhist_concern = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Concern/Empathy' THEN sp_fammedhist_concern = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Concern/Empathy' THEN pcp_hlthbeh_concern = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Concern/Empathy' THEN sp_hlthbeh_concern = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Concern/Empathy' THEN pcp_pyschinfo_concern = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Concern/Empathy' THEN sp_pyschinfo_concern = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Concern/Empathy' THEN pcp_physexam_concern = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Concern/Empathy' THEN sp_physexam_concern = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Concern/Empathy' THEN pcp_sympt_concern = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Concern/Empathy' THEN sp_sympt_concern = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Concern/Empathy' THEN pcp_oript_concern = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Concern/Empathy' THEN sp_oript_concern = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Concern/Empathy' THEN pcp_fin_concern = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Concern/Empathy' THEN sp_fin_concern = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Concern/Empathy' THEN pcp_possdiag_concern = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Concern/Empathy' THEN sp_possdiag_concern = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Concern/Empathy' THEN pcp_ref_concern = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Concern/Empathy' THEN sp_ref_concern = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Concern/Empathy' THEN pcp_tests_concern = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Concern/Empathy' THEN sp_tests_concern = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Concern/Empathy' THEN pcp_med_concern = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Concern/Empathy' THEN sp_med_concern = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Concern/Empathy' THEN pcp_othertx_concern = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Concern/Empathy' THEN sp_othertx_concern = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Concern/Empathy' THEN pcp_emot_concern = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Concern/Empathy' THEN sp_emot_concern = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Concern/Empathy' THEN pcp_social_concern = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Concern/Empathy' THEN sp_social_concern = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Concern/Empathy' THEN pcp_closing_concern = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Concern/Empathy' THEN sp_closing_concern = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Concern/Empathy' THEN pcp_unint_concern = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Concern/Empathy' THEN sp_unint_concern = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Concern/Empathy' THEN pcp_bckch_concern = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Concern/Empathy' THEN sp_bckch_concern = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Legitimize/Acknowledge' THEN pcp_int_legit = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Legitimize/Acknowledge' THEN sp_int_legit = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Legitimize/Acknowledge' THEN pcp_medhist_legit = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Legitimize/Acknowledge' THEN sp_medhist_legit = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Legitimize/Acknowledge' THEN pcp_gimedhist_legit = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Legitimize/Acknowledge' THEN sp_gimedhist_legit = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Legitimize/Acknowledge' THEN pcp_fammedhist_legit = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Legitimize/Acknowledge' THEN sp_fammedhist_legit = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Legitimize/Acknowledge' THEN pcp_hlthbeh_legit = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Legitimize/Acknowledge' THEN sp_hlthbeh_legit = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Legitimize/Acknowledge' THEN pcp_pyschinfo_legit = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Legitimize/Acknowledge' THEN sp_pyschinfo_legit = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Legitimize/Acknowledge' THEN pcp_physexam_legit = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Legitimize/Acknowledge' THEN sp_physexam_legit = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Legitimize/Acknowledge' THEN pcp_sympt_legit = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Legitimize/Acknowledge' THEN sp_sympt_legit = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Legitimize/Acknowledge' THEN pcp_oript_legit = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Legitimize/Acknowledge' THEN sp_oript_legit = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Legitimize/Acknowledge' THEN pcp_fin_legit = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Legitimize/Acknowledge' THEN sp_fin_legit = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Legitimize/Acknowledge' THEN pcp_possdiag_legit = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Legitimize/Acknowledge' THEN sp_possdiag_legit = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Legitimize/Acknowledge' THEN pcp_ref_legit = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Legitimize/Acknowledge' THEN sp_ref_legit = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Legitimize/Acknowledge' THEN pcp_tests_legit = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Legitimize/Acknowledge' THEN sp_tests_legit = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Legitimize/Acknowledge' THEN pcp_med_legit = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Legitimize/Acknowledge' THEN sp_med_legit = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Legitimize/Acknowledge' THEN pcp_othertx_legit = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Legitimize/Acknowledge' THEN sp_othertx_legit = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Legitimize/Acknowledge' THEN pcp_emot_legit = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Legitimize/Acknowledge' THEN sp_emot_legit = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Legitimize/Acknowledge' THEN pcp_social_legit = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Legitimize/Acknowledge' THEN sp_social_legit = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Legitimize/Acknowledge' THEN pcp_closing_legit = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Legitimize/Acknowledge' THEN sp_closing_legit = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Legitimize/Acknowledge' THEN pcp_unint_legit = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Legitimize/Acknowledge' THEN sp_unint_legit = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Legitimize/Acknowledge' THEN pcp_bckch_legit = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Legitimize/Acknowledge' THEN sp_bckch = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Apology' THEN pcp_int_apology = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Apology' THEN sp_int_apology = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Apology' THEN pcp_medhist_apology = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Apology' THEN sp_medhist_apology = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Apology' THEN pcp_gimedhist_apology = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Apology' THEN sp_gimedhist_apology = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Apology' THEN pcp_fammedhist_apology = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Apology' THEN sp_fammedhist_apology = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Apology' THEN pcp_hlthbeh_apology = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Apology' THEN sp_hlthbeh_apology = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Apology' THEN pcp_pyschinfo_apology = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Apology' THEN sp_pyschinfo_apology = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Apology' THEN pcp_physexam_apology = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Apology' THEN sp_physexam_apology = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Apology' THEN pcp_sympt_apology = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Apology' THEN sp_sympt_apology = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Apology' THEN pcp_oript_apology = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Apology' THEN sp_oript_apology = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Apology' THEN pcp_fin_apology = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Apology' THEN sp_fin_apology = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Apology' THEN pcp_possdiag_apology = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Apology' THEN sp_possdiag_apology = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Apology' THEN pcp_ref_apology = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Apology' THEN sp_ref_apology = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Apology' THEN pcp_tests_apology = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Apology' THEN sp_tests_apology = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Apology' THEN pcp_med_apology = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Apology' THEN sp_med_apology = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Apology' THEN pcp_othertx_apology = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Apology' THEN sp_othertx_apology = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Apology' THEN pcp_emot_apology = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Apology' THEN sp_emot_apology = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Apology' THEN pcp_social_apology = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Apology' THEN sp_social_apology = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Apology' THEN pcp_closing_apology = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Apology' THEN sp_closing_apology = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Apology' THEN pcp_unint_apology = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Apology' THEN sp_unint_apology = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Apology' THEN pcp_bckch_apology = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Apology' THEN sp_bckch_apology = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Reassurance' THEN pcp_int_reassur = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Reassurance' THEN sp_int_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Reassurance' THEN pcp_medhist_reassur = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Reassurance' THEN sp_medhist_reassur = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Reassurance' THEN pcp_gimedhist_reassur = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Reassurance' THEN sp_gimedhist_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Reassurance' THEN pcp_fammedhist_reassur = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Reassurance' THEN sp_fammedhist_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Reassurance' THEN pcp_hlthbeh_reassur = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Reassurance' THEN sp_hlthbeh_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Reassurance' THEN pcp_pyschinfo_reassur = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Reassurance' THEN sp_pyschinfo_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Reassurance' THEN pcp_physexam_reassur = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Reassurance' THEN sp_physexam_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Reassurance' THEN pcp_sympt_reassur = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Reassurance' THEN sp_sympt_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Reassurance' THEN pcp_oript_reassur = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Reassurance' THEN sp_oript_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Reassurance' THEN pcp_fin_reassur = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Reassurance' THEN sp_fin_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Reassurance' THEN pcp_possdiag_reassur = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Reassurance' THEN sp_possdiag_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Reassurance' THEN pcp_ref_reassur = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Reassurance' THEN sp_ref_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Reassurance' THEN pcp_tests_reassur = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Reassurance' THEN sp_tests_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Reassurance' THEN pcp_med_reassur = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Reassurance' THEN sp_med_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Reassurance' THEN pcp_othertx_reassur = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Reassurance' THEN sp_othertx_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Reassurance' THEN pcp_emot_reassur = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Reassurance' THEN sp_emot_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Reassurance' THEN pcp_social_reassur = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Reassurance' THEN sp_social_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Reassurance' THEN pcp_closing_reassur = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Reassurance' THEN sp_closing_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Reassurance' THEN pcp_unint_reassur = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Reassurance' THEN sp_unint_reassur = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Reassurance' THEN pcp_bckch_reassur = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Reassurance' THEN sp_bckch_reassur = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Laughter (Positive)' THEN pcp_int_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Laughter (Positive)' THEN sp_int_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Laughter (Positive)' THEN pcp_medhist_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Laughter (Positive)' THEN sp_medhist_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Laughter (Positive)' THEN pcp_gimedhist_laughpos = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Laughter (Positive)' THEN sp_gimedhist_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Laughter (Positive)' THEN pcp_fammedhist_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Laughter (Positive)' THEN sp_fammedhist_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Laughter (Positive)' THEN pcp_hlthbeh_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Laughter (Positive)' THEN sp_hlthbeh_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Laughter (Positive)' THEN pcp_pyschinfo_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Laughter (Positive)' THEN sp_pyschinfo_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Laughter (Positive)' THEN pcp_physexam_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Laughter (Positive)' THEN sp_physexam_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Laughter (Positive)' THEN pcp_sympt_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Laughter (Positive)' THEN sp_sympt_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Laughter (Positive)' THEN pcp_oript_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Laughter (Positive)' THEN sp_oript_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Laughter (Positive)' THEN pcp_fin_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Laughter (Positive)' THEN sp_fin_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Laughter (Positive)' THEN pcp_possdiag_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Laughter (Positive)' THEN sp_possdiag_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Laughter (Positive)' THEN pcp_ref_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Laughter (Positive)' THEN sp_ref_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Laughter (Positive)' THEN pcp_tests_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Laughter (Positive)' THEN sp_tests_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Laughter (Positive)' THEN pcp_med_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Laughter (Positive)' THEN sp_med_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Laughter (Positive)' THEN pcp_othertx_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Laughter (Positive)' THEN sp_othertx_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Laughter (Positive)' THEN pcp_emot_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Laughter (Positive)' THEN sp_emot_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Laughter (Positive)' THEN pcp_social_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Laughter (Positive)' THEN sp_social_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Laughter (Positive)' THEN pcp_closing_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Laughter (Positive)' THEN sp_closing_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Laughter (Positive)' THEN pcp_unint_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Laughter (Positive)' THEN sp_unint_laughpos = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Laughter (Positive)' THEN pcp_bckch_laughpos = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Laughter (Positive)' THEN sp_bckch_laughpos = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Disapproval' THEN pcp_int_disapp = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Disapproval' THEN sp_int_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Disapproval' THEN pcp_medhist_disapp = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Disapproval' THEN sp_medhist_disapp = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Disapproval' THEN pcp_gimedhist_disapp = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Disapproval' THEN sp_gimedhist_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Disapproval' THEN pcp_fammedhist_disapp = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Disapproval' THEN sp_fammedhist_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Disapproval' THEN pcp_hlthbeh_disapp = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Disapproval' THEN sp_hlthbeh_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Disapproval' THEN pcp_pyschinfo_disapp = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Disapproval' THEN sp_pyschinfo_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Disapproval' THEN pcp_physexam_disapp = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Disapproval' THEN sp_physexam_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Disapproval' THEN pcp_sympt_disapp = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Disapproval' THEN sp_sympt_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Disapproval' THEN pcp_oript_disapp = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Disapproval' THEN sp_oript_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Disapproval' THEN pcp_fin_disapp = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Disapproval' THEN sp_fin_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Disapproval' THEN pcp_possdiag_disapp = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Disapproval' THEN sp_possdiag_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Disapproval' THEN pcp_ref_disapp = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Disapproval' THEN sp_ref_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Disapproval' THEN pcp_tests_disapp = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Disapproval' THEN sp_tests_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Disapproval' THEN pcp_med_disapp = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Disapproval' THEN sp_med_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Disapproval' THEN pcp_othertx_disapp = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Disapproval' THEN sp_othertx_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Disapproval' THEN pcp_emot_disapp = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Disapproval' THEN sp_emot_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Disapproval' THEN pcp_social_disapp = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Disapproval' THEN sp_social_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Disapproval' THEN pcp_closing_disapp = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Disapproval' THEN sp_closing_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Disapproval' THEN pcp_unint_disapp = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Disapproval' THEN sp_unint_disapp = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Disapproval' THEN pcp_bckch_disapp = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Disapproval' THEN sp_bckch_disapp = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Ambiguous Response' THEN pcp_int_ambi = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Ambiguous Response' THEN sp_int_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Ambiguous Response' THEN pcp_medhist_ambi = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Ambiguous Response' THEN sp_medhist_ambi = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Ambiguous Response' THEN pcp_gimedhist_ambi = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Ambiguous Response' THEN sp_gimedhist_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Ambiguous Response' THEN pcp_fammedhist_ambi = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Ambiguous Response' THEN sp_fammedhist_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Ambiguous Response' THEN pcp_hlthbeh_ambi = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Ambiguous Response' THEN sp_hlthbeh_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Ambiguous Response' THEN pcp_pyschinfo_ambi = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Ambiguous Response' THEN sp_pyschinfo_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Ambiguous Response' THEN pcp_physexam_ambi = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Ambiguous Response' THEN sp_physexam_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Ambiguous Response' THEN pcp_sympt_ambi = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Ambiguous Response' THEN sp_sympt_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Ambiguous Response' THEN pcp_oript_ambi = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Ambiguous Response' THEN sp_oript_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Ambiguous Response' THEN pcp_fin_ambi = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Ambiguous Response' THEN sp_fin_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Ambiguous Response' THEN pcp_possdiag_ambi = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Ambiguous Response' THEN sp_possdiag_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Ambiguous Response' THEN pcp_ref_ambi = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Ambiguous Response' THEN sp_ref_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Ambiguous Response' THEN pcp_tests_ambi = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Ambiguous Response' THEN sp_tests_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Ambiguous Response' THEN pcp_med_ambi = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Ambiguous Response' THEN sp_med_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Ambiguous Response' THEN pcp_othertx_ambi = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Ambiguous Response' THEN sp_othertx_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Ambiguous Response' THEN pcp_emot_ambi = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Ambiguous Response' THEN sp_emot_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Ambiguous Response' THEN pcp_social_ambi = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Ambiguous Response' THEN sp_social_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Ambiguous Response' THEN pcp_closing_ambi = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Ambiguous Response' THEN sp_closing_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Ambiguous Response' THEN pcp_unint_ambi = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Ambiguous Response' THEN sp_unint_ambi = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Ambiguous Response' THEN pcp_bckch_ambi = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Ambiguous Response' THEN sp_bckch_ambi = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Indifferent Response' THEN pcp_int_indiff = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Indifferent Response' THEN sp_int_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Indifferent Response' THEN pcp_medhist_indiff = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Indifferent Response' THEN sp_medhist_indiff = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Indifferent Response' THEN pcp_gimedhist_indiff = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Indifferent Response' THEN sp_gimedhist_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Indifferent Response' THEN pcp_fammedhist_indiff = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Indifferent Response' THEN sp_fammedhist_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Indifferent Response' THEN pcp_hlthbeh_indiff = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Indifferent Response' THEN sp_hlthbeh_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Indifferent Response' THEN pcp_pyschinfo_indiff = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Indifferent Response' THEN sp_pyschinfo_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Indifferent Response' THEN pcp_physexam_indiff = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Indifferent Response' THEN sp_physexam_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Indifferent Response' THEN pcp_sympt_indiff = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Indifferent Response' THEN sp_sympt_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Indifferent Response' THEN pcp_oript_indiff = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Indifferent Response' THEN sp_oript_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Indifferent Response' THEN pcp_fin_indiff = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Indifferent Response' THEN sp_fin_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Indifferent Response' THEN pcp_possdiag_indiff = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Indifferent Response' THEN sp_possdiag_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Indifferent Response' THEN pcp_ref_indiff = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Indifferent Response' THEN sp_ref_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Indifferent Response' THEN pcp_tests_indiff = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Indifferent Response' THEN sp_tests_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Indifferent Response' THEN pcp_med_indiff = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Indifferent Response' THEN sp_med_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Indifferent Response' THEN pcp_othertx_indiff = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Indifferent Response' THEN sp_othertx_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Indifferent Response' THEN pcp_emot_indiff = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Indifferent Response' THEN sp_emot_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Indifferent Response' THEN pcp_social_indiff = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Indifferent Response' THEN sp_social_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Indifferent Response' THEN pcp_closing_indiff = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Indifferent Response' THEN sp_closing_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Indifferent Response' THEN pcp_unint_indiff = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Indifferent Response' THEN sp_unint_indiff = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Indifferent Response' THEN pcp_bckch = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Indifferent Response' THEN sp_bckch = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Tangential' THEN pcp_int_tangent = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Tangential' THEN sp_int_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Tangential' THEN pcp_medhist_tangent = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Tangential' THEN sp_medhist_tangent = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Tangential' THEN pcp_gimedhist_tangent = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Tangential' THEN sp_gimedhist_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Tangential' THEN pcp_fammedhist_tangent = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Tangential' THEN sp_fammedhist_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Tangential' THEN pcp_hlthbeh_tangent = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Tangential' THEN sp_hlthbeh_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Tangential' THEN pcp_pyschinfo_tangent = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Tangential' THEN sp_pyschinfo_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Tangential' THEN pcp_physexam_tangent = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Tangential' THEN sp_physexam_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Tangential' THEN pcp_sympt_tangent = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Tangential' THEN sp_sympt_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Tangential' THEN pcp_oript_tangent = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Tangential' THEN sp_oript_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Tangential' THEN pcp_fin_tangent = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Tangential' THEN sp_fin_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Tangential' THEN pcp_possdiag_tangent = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Tangential' THEN sp_possdiag_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Tangential' THEN pcp_ref_tangent = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Tangential' THEN sp_ref_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Tangential' THEN pcp_tests_tangent = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Tangential' THEN sp_tests_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Tangential' THEN pcp_med_tangent = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Tangential' THEN sp_med_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Tangential' THEN pcp_othertx_tangent = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Tangential' THEN sp_othertx_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Tangential' THEN pcp_emot_tangent = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Tangential' THEN sp_emot_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Tangential' THEN pcp_social_tangent = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Tangential' THEN sp_social_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Tangential' THEN pcp_closing_tangent = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Tangential' THEN sp_closing_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Tangential' THEN pcp_unint_tangent = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Tangential' THEN sp_unint_tangent = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Tangential' THEN pcp_bckch_tangent = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Tangential' THEN sp_bckch_tangent = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Disparaging' THEN pcp_int_disparag = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Disparaging' THEN sp_int_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Disparaging' THEN pcp_medhist_disparag = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Disparaging' THEN sp_medhist_disparag = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Disparaging' THEN pcp_gimedhist_disparag = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Disparaging' THEN sp_gimedhist_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Disparaging' THEN pcp_fammedhist_disparag = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Disparaging' THEN sp_fammedhist_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Disparaging' THEN pcp_hlthbeh_disparag = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Disparaging' THEN sp_hlthbeh_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Disparaging' THEN pcp_pyschinfo_disparag = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Disparaging' THEN sp_pyschinfo_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Disparaging' THEN pcp_physexam_disparag = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Disparaging' THEN sp_physexam_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Disparaging' THEN pcp_sympt_disparag = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Disparaging' THEN sp_sympt_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Disparaging' THEN pcp_oript_disparag = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Disparaging' THEN sp_oript_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Disparaging' THEN pcp_fin_disparag = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Disparaging' THEN sp_fin_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Disparaging' THEN pcp_possdiag_disparag = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Disparaging' THEN sp_possdiag_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Disparaging' THEN pcp_ref_disparag = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Disparaging' THEN sp_ref_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Disparaging' THEN pcp_tests_disparag = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Disparaging' THEN sp_tests_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Disparaging' THEN pcp_med_disparag = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Disparaging' THEN sp_med_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Disparaging' THEN pcp_othertx_disparag = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Disparaging' THEN sp_othertx_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Disparaging' THEN pcp_emot_disparag = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Disparaging' THEN sp_emot_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Disparaging' THEN pcp_social_disparag = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Disparaging' THEN sp_social_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Disparaging' THEN pcp_closing_disparag = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Disparaging' THEN sp_closing_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Disparaging' THEN pcp_unint_disparag = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Disparaging' THEN sp_unint_disparag = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Disparaging' THEN pcp_bckch_disparag = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Disparaging' THEN sp_bckch_disparag = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Irrelevent Response' THEN pcp_int_irrel = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Irrelevent Response' THEN sp_int_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Irrelevent Response' THEN pcp_medhist_irrel = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Irrelevent Response' THEN sp_medhist_irrel = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Irrelevent Response' THEN pcp_gimedhist_irrel = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Irrelevent Response' THEN sp_gimedhist_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Irrelevent Response' THEN pcp_fammedhist_irrel = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Irrelevent Response' THEN sp_fammedhist_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Irrelevent Response' THEN pcp_hlthbeh_irrel = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Irrelevent Response' THEN sp_hlthbeh_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Irrelevent Response' THEN pcp_pyschinfo_irrel = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Irrelevent Response' THEN sp_pyschinfo_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Irrelevent Response' THEN pcp_physexam_irrel = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Irrelevent Response' THEN sp_physexam_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Irrelevent Response' THEN pcp_sympt_irrel = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Irrelevent Response' THEN sp_sympt_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Irrelevent Response' THEN pcp_oript_irrel = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Irrelevent Response' THEN sp_oript_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Irrelevent Response' THEN pcp_fin_irrel = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Irrelevent Response' THEN sp_fin_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Irrelevent Response' THEN pcp_possdiag_irrel = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Irrelevent Response' THEN sp_possdiag_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Irrelevent Response' THEN pcp_ref_irrel = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Irrelevent Response' THEN sp_ref_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Irrelevent Response' THEN pcp_tests_irrel = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Irrelevent Response' THEN sp_tests_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Irrelevent Response' THEN pcp_med_irrel = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Irrelevent Response' THEN sp_med_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Irrelevent Response' THEN pcp_othertx_irrel = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Irrelevent Response' THEN sp_othertx_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Irrelevent Response' THEN pcp_emot_irrel = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Irrelevent Response' THEN sp_emot_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Irrelevent Response' THEN pcp_social_irrel = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Irrelevent Response' THEN sp_social_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Irrelevent Response' THEN pcp_closing_irrel = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Irrelevent Response' THEN sp_closing_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Irrelevent Response' THEN pcp_unint_irrel = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Irrelevent Response' THEN sp_unint_irrel = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Irrelevent Reponse' THEN pcp_bckch_irrel = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Irrelevent Response' THEN sp_bckch_irrel = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Laughter (Negative)' THEN pcp_int_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Laughter (Negative)' THEN sp_int_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Laughter (Negative)' THEN pcp_medhist_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Laughter (Negative)' THEN sp_medhist_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Laughter (Negative)' THEN pcp_gimedhist_laughneg = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Laughter (Negative)' THEN sp_gimedhist_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Laughter (Negative)' THEN pcp_fammedhist_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Laughter (Negative)' THEN sp_fammedhist_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Laughter (Negative)' THEN pcp_hlthbeh_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Laughter (Negative)' THEN sp_hlthbeh_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Laughter (Negative)' THEN pcp_pyschinfo_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Laughter (Negative)' THEN sp_pyschinfo_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Laughter (Negative)' THEN pcp_physexam_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Laughter (Negative)' THEN sp_physexam_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Laughter (Negative)' THEN pcp_sympt_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Laughter (Negative)' THEN sp_sympt_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Laughter (Negative)' THEN pcp_oript_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Laughter (Negative)' THEN sp_oript_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Laughter (Negative)' THEN pcp_fin_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Laughter (Negative)' THEN sp_fin_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Laughter (Negative)' THEN pcp_possdiag_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Laughter (Negative)' THEN sp_possdiag_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Laughter (Negative)' THEN pcp_ref_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Laughter (Negative)' THEN sp_ref_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Laughter (Negative)' THEN pcp_tests_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Laughter (Negative)' THEN sp_tests_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Laughter (Negative)' THEN pcp_med_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Laughter (Negative)' THEN sp_med_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Laughter (Negative)' THEN pcp_othertx_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Laughter (Negative)' THEN sp_othertx_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Laughter (Negative)' THEN pcp_emot_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Laughter (Negative)' THEN sp_emot_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Laughter (Negative)' THEN pcp_social_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Laughter (Negative)' THEN sp_social_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Laughter (Negative)' THEN pcp_closing_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Laughter (Negative)' THEN sp_closing_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Laughter (Negative)' THEN pcp_unint_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Laughter (Negative)' THEN sp_unint_laughneg = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Laughter (Negative)' THEN pcp_bckch_laughneg = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Laughter (Negative)' THEN sp_bckch_laughneg = 1;

   if speaker_type = 'HCP' & topic = 'Introduction' & communication_type = 'Jargon & Euphemisms' THEN pcp_int_jarg = 1;
   if speaker_type = 'PT' & topic = 'Introduction' & communication_type = 'Jargon & Euphemisms' THEN sp_int_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Medical History' & communication_type = 'Jargon & Euphemisms' THEN pcp_medhist_jarg = 1;
   if speaker_type = 'PT' & topic = 'Medical History' & communication_type = 'Jargon & Euphemisms' THEN sp_medhist_jarg = 1;
   if speaker_type = 'HCP' & topic = 'GI Medical History' & communication_type = 'Jargon & Euphemisms' THEN pcp_gimedhist_jarg = 1;
   if speaker_type = 'PT' & topic = 'GI Medical History' & communication_type = 'Jargon & Euphemisms' THEN sp_gimedhist_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Family Medical History' & communication_type = 'Jargon & Euphemisms' THEN pcp_fammedhist_jarg = 1;
   if speaker_type = 'PT' & topic = 'Family Medical History' & communication_type = 'Jargon & Euphemisms' THEN sp_fammedhist_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Health Behaviors' & communication_type = 'Jargon & Euphemisms' THEN pcp_hlthbeh_jarg = 1;
   if speaker_type = 'PT' & topic = 'Health Behaviors' & communication_type = 'Jargon & Euphemisms' THEN sp_hlthbeh_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Psychosocial Information' & communication_type = 'Jargon & Euphemisms' THEN pcp_pyschinfo_jarg = 1;
   if speaker_type = 'PT' & topic = 'Psychosocial Information' & communication_type = 'Jargon & Euphemisms' THEN sp_pyschinfo_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Physical Exam' & communication_type = 'Jargon & Euphemisms' THEN pcp_physexam_jarg = 1;
   if speaker_type = 'PT' & topic = 'Physical Exam' & communication_type = 'Jargon & Euphemisms' THEN sp_physexam_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Symptoms' & communication_type = 'Jargon & Euphemisms' THEN pcp_sympt_jarg = 1;
   if speaker_type = 'PT' & topic = 'Symptoms' & communication_type = 'Jargon & Euphemisms' THEN sp_sympt_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Orients Patient' & communication_type = 'Jargon & Euphemisms' THEN pcp_oript_jarg = 1;
   if speaker_type = 'PT' & topic = 'Orients Patient' & communication_type = 'Jargon & Euphemisms' THEN sp_oript_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Financial' & communication_type = 'Jargon & Euphemisms' THEN pcp_fin_jarg = 1;
   if speaker_type = 'PT' & topic = 'Financial' & communication_type = 'Jargon & Euphemisms' THEN sp_fin_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Possible Diagnoses' & communication_type = 'Jargon & Euphemisms' THEN pcp_possdiag_jarg = 1;
   if speaker_type = 'PT' & topic = 'Possible Diagnoses' & communication_type = 'Jargon & Euphemisms' THEN sp_possdiag_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Referrals' & communication_type = 'Jargon & Euphemisms' THEN pcp_ref_jarg = 1;
   if speaker_type = 'PT' & topic = 'Referrals' & communication_type = 'Jargon & Euphemisms' THEN sp_ref_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Tests Offered' & communication_type = 'Jargon & Euphemisms' THEN pcp_tests_jarg = 1;
   if speaker_type = 'PT' & topic = 'Tests Offered' & communication_type = 'Jargon & Euphemisms' THEN sp_tests_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Medication' & communication_type = 'Jargon & Euphemisms' THEN pcp_med_jarg = 1;
   if speaker_type = 'PT' & topic = 'Medication' & communication_type = 'Jargon & Euphemisms' THEN sp_med_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Other Treatments' & communication_type = 'Jargon & Euphemisms' THEN pcp_othertx_jarg = 1;
   if speaker_type = 'PT' & topic = 'Other Treatments' & communication_type = 'Jargon & Euphemisms' THEN sp_othertx_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Emotions' & communication_type = 'Jargon & Euphemisms' THEN pcp_emot_jarg = 1;
   if speaker_type = 'PT' & topic = 'Emotions' & communication_type = 'Jargon & Euphemisms' THEN sp_emot_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Social Chitchat' & communication_type = 'Jargon & Euphemisms' THEN pcp_social_jarg = 1;
   if speaker_type = 'PT' & topic = 'Social Chitchat' & communication_type = 'Jargon & Euphemisms' THEN sp_social_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Follow up and Closing' & communication_type = 'Jargon & Euphemisms' THEN pcp_closing_jarg = 1;
   if speaker_type = 'PT' & topic = 'Follow up and Closing' & communication_type = 'Jargon & Euphemisms' THEN sp_closing_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Unintelligible' & communication_type = 'Jargon & Euphemisms' THEN pcp_unint_jarg = 1;
   if speaker_type = 'PT' & topic = 'Unintelligible' & communication_type = 'Jargon & Euphemisms' THEN sp_unint_jarg = 1;
   if speaker_type = 'HCP' & topic = 'Back Channels/Fillers' & communication_type = 'Jargon & Euphemisms' THEN pcp_bckch_jarg = 1;
   if speaker_type = 'PT' & topic = 'Back Channels/Fillers' & communication_type = 'Jargon & Euphemisms' THEN sp_bckch_jarg = 1;
run;

PROC SQL;
create table WORK.content_merge1 as
Select
COUNTS.case_id,
SUM(COUNTS.hcp_ia) as pcp_ia label="Total number of statements given by PCP",
SUM(COUNTS.hcp_q) as pcp_q label="Total number of questions asked by PCP ",
SUM(COUNTS.pt_ia) as sp_ia label="Total number of statements given by SP",
SUM(COUNTS.pt_q) as sp_q label="Total number of questions asked by SP"
from WORK.COUNTS
group by COUNTS.case_id;

PROC SQL;
create table WORK.content_merge2 as
Select
CONTENT14.case_id,
SUM(CONTENT14.pcp_openq) as pcp_open label="Total number of open-ended questions asked by PCP",
SUM(CONTENT14.sp_openq) as sp_open label="Total number of open-ended questions asked by SP"
from WORK.CONTENT14
group by CONTENT14.case_id;

PROC SQL;
create table WORK.content_merge3 as
Select
CONTENT15.case_id,
SUM(CONTENT15.pcp_int_arg) as pcp_int_arg label="Frequency count of Introduction utterances of type Argument for PCP",
SUM(CONTENT15.sp_int_arg) as sp_int_arg label="Frequency count of Introduction utterances of type Argument for SP",
SUM(CONTENT15.pcp_medhist_arg) as pcp_medhist_arg label="Frequency count of Medical History utterances of type Argument for PCP",
SUM(CONTENT15.sp_medhist_arg) as sp_medhist_arg label="Frequency count of Medical History utterances of type Argument for SP",
SUM(CONTENT15.pcp_gimedhist_arg) as pcp_gimedhist_arg label="Frequency count of GI Medical History utterances of type Argument for PCP",
SUM(CONTENT15.sp_gimedhist_arg) as sp_gimedhist_arg label="Frequency count of GI Medical History utterances of type Argument for SP",
SUM(CONTENT15.pcp_fammedhist_arg) as pcp_fammedhist_arg label="Frequency count of Family Medical History utterances of type Argument for PCP",
SUM(CONTENT15.sp_fammedhist_arg) as sp_fammedhist_arg label="Frequency count of Family Medical History utterances of type Argument for SP",
SUM(CONTENT15.pcp_hlthbeh_arg) as pcp_hlthbeh_arg label="Frequency count of Health Behaviors utterances of type Argument for PCP",
SUM(CONTENT15.sp_hlthbeh_arg) as sp_hlthbeh_arg label="Frequency count of Health Behaviors utterances of type Argument for SP",
SUM(CONTENT15.pcp_pyschinfo_arg) as pcp_pyschinfo_arg label="Frequency count of Psychosocial information utterances of type Argument for PCP",
SUM(CONTENT15.sp_pyschinfo_arg) as sp_pyschinfo_arg label="Frequency count of Psychosocial information utterances of type Argument for SP",
SUM(CONTENT15.pcp_physexam_arg) as pcp_physexam_arg label="Frequency count of Physical exam utterances of type Argument for PCP",
SUM(CONTENT15.sp_physexam_arg) as sp_physexam_arg label="Frequency count of Physical exam utterances of type Argument for SP",
SUM(CONTENT15.pcp_sympt_arg) as pcp_sympt_arg label="Frequency count of Symptoms utterances of type Argument for PCP",
SUM(CONTENT15.sp_sympt_arg) as sp_sympt_arg label="Frequency count of Symptoms utterances of type Argument for SP",
SUM(CONTENT15.pcp_oript_arg) as pcp_oript_arg label="Frequency count of Orients patient utterances of type Argument for PCP",
SUM(CONTENT15.sp_oript_arg) as sp_oript_arg label="Frequency count of Orients patient utterances of type Argument for SP",
SUM(CONTENT15.pcp_fin_arg) as pcp_fin_arg label="Frequency count of Financial utterances of type Argument for PCP",
SUM(CONTENT15.sp_fin_arg) as sp_fin_arg label="Frequency count of Financial utterances of type Argument for SP",
SUM(CONTENT15.pcp_possdiag_arg) as pcp_possdiag_arg label="Frequency count of Possible diagnoses utterances of type Argument for PCP",
SUM(CONTENT15.sp_possdiag_arg) as sp_possdiag_arg label="Frequency count of Possible diagnoses utterances of type Argument for SP",
SUM(CONTENT15.pcp_ref_arg) as pcp_ref_arg label="Frequency count of Referrals utterances of type Argument for PCP",
SUM(CONTENT15.sp_ref_arg) as sp_ref_arg label="Frequency count of Referrals utterances of type Argument for SP",
SUM(CONTENT15.pcp_tests_arg) as pcp_tests_arg label="Frequency count of Tests offered utterances of type Argument for PCP",
SUM(CONTENT15.sp_tests_arg) as sp_tests_arg label="Frequency count of Tests offered utterances of type Argument for SP",
SUM(CONTENT15.pcp_med_arg) as pcp_med_arg label="Frequency count of Medication utterances of type Argument for PCP",
SUM(CONTENT15.sp_med_arg) as sp_med_arg label="Frequency count of Medication utterances of type Argument for SP",
SUM(CONTENT15.pcp_othertx_arg) as pcp_othertx_arg label="Frequency count of Other treatments utterances of type Argument for PCP",
SUM(CONTENT15.sp_othertx_arg) as sp_othertx_arg label="Frequency count of Other treatments utterances of type Argument for SP",
SUM(CONTENT15.pcp_emot_arg) as pcp_emot_arg label="Frequency count of Emotions utterances of type Argument for PCP",
SUM(CONTENT15.sp_emot_arg) as sp_emot_arg label="Frequency count of Emotions utterances of type Argument for SP",
SUM(CONTENT15.pcp_social_arg) as pcp_social_arg label="Frequency count of Social Chitchat utterances of type Argument for PCP",
SUM(CONTENT15.sp_social_arg) as sp_social_arg label="Frequency count of Social Chitchat utterances of type Argument for SP",
SUM(CONTENT15.pcp_closing_arg) as pcp_closing_arg label="Frequency count of Follow up and closing utterances of type Argument for PCP",
SUM(CONTENT15.sp_closing_arg) as sp_closing_arg label="Frequency count of Follow up and closing utterances of type Argument for SP",
SUM(CONTENT15.pcp_unint_arg) as pcp_unint_arg label="Frequency count of Unintelligible utterances of type Argument for PCP",
SUM(CONTENT15.sp_unint_arg) as sp_unint_arg label="Frequency count of Unintelligible utterances of type Argument for SP",
SUM(CONTENT15.sp_bckch_arg) as pcp_bckch_arg label="Frequency count of Back Channel/Filler utterances of type Argument for PCP",
SUM(CONTENT15.sp_bckch_arg) as sp_bckch_arg label="Frequency count of Back Channel/Filler utterances of type Argument for SP",

SUM(CONTENT15.pcp_int_refut) as pcp_int_refut label="Frequency count of Introduction utterances of type Refutation for PCP",
SUM(CONTENT15.sp_int_refut) as sp_int_refut label="Frequency count of Introduction utterances of type Refutation for SP",
SUM(CONTENT15.pcp_medhist_refut) as pcp_medhist_refut label="Frequency count of Medical History utterances of type Refutation for PCP",
SUM(CONTENT15.sp_medhist_refut) as sp_medhist_refut label="Frequency count of Medical History utterances of type Refutation for SP",
SUM(CONTENT15.pcp_gimedhist_refut) as pcp_gimedhist_refut label="Frequency count of GI Medical History utterances of type Refutation for PCP",
SUM(CONTENT15.sp_gimedhist_refut) as sp_gimedhist_refut label="Frequency count of GI Medical History utterances of type Refutation for SP",
SUM(CONTENT15.pcp_fammedhist_refut) as pcp_fammedhist_refut label="Frequency count of FamilyMedical Hist utterances of type Refutation for PCP",
SUM(CONTENT15.sp_fammedhist_refut) as sp_fammedhist_refut label="Frequency count of Family Medical Hist utterances of type Refutation for SP",
SUM(CONTENT15.pcp_hlthbeh_refut) as pcp_hlthbeh_refut label="Frequency count of Health Behaviors utterances of type Refutation for PCP",
SUM(CONTENT15.sp_hlthbeh_refut) as sp_hlthbeh_refut label="Frequency count of Health Behaviors utterances of type Refutation for SP",
SUM(CONTENT15.pcp_pyschinfo_refut) as pcp_pyschinfo_refut label="Frequency count of Psychosocial info utterances of type Refutation for PCP",
SUM(CONTENT15.sp_pyschinfo_refut) as sp_pyschinfo_refut label="Frequency count of Psychosocial info utterances of type Refutation for SP",
SUM(CONTENT15.pcp_physexam_refut) as pcp_physexam_refut label="Frequency count of Physical exam utterances of type Refutation for PCP",
SUM(CONTENT15.sp_physexam_refut) as sp_physexam_refut label="Frequency count of Physical exam utterances of type Refutation for SP",
SUM(CONTENT15.pcp_sympt_refut) as pcp_sympt_refut label="Frequency count of Symptoms utterances of type Refutation for PCP",
SUM(CONTENT15.sp_sympt_refut) as sp_sympt_refut label="Frequency count of Symptoms utterances of type Refutation for SP",
SUM(CONTENT15.pcp_oript_refut) as pcp_oript_refut label="Frequency count of Orients patient utterances of type Refutation for PCP",
SUM(CONTENT15.sp_oript_refut) as sp_oript_refut label="Frequency count of Orients patient utterances of type Refutation for SP",
SUM(CONTENT15.pcp_fin_refut) as pcp_fin_refut label="Frequency count of Financial utterances of type Refutation for PCP",
SUM(CONTENT15.sp_fin_refut) as sp_fin_refut label="Frequency count of Financial utterances of type Refutation for SP",
SUM(CONTENT15.pcp_possdiag_refut) as pcp_possdiag_refu label="Frequency count of Possible diagnoses utterances of type Refutation for PCP",
SUM(CONTENT15.sp_possdiag_refut) as sp_possdiag_refut label="Frequency count of Possible diagnoses utterances of type Refutation for SP",
SUM(CONTENT15.pcp_ref_refut) as pcp_ref_refut label="Frequency count of Referrals utterances of type Refutation for PCP",
SUM(CONTENT15.sp_ref_refut) as sp_ref_refut label="Frequency count of Referrals utterances of type Refutation for SP",
SUM(CONTENT15.pcp_tests_refut) as pcp_tests_refut label="Frequency count of Tests offered utterances of type Refutation for PCP",
SUM(CONTENT15.sp_tests_refut) as sp_tests_refut label="Frequency count of Tests offered utterances of type Refutation for SP",
SUM(CONTENT15.pcp_med_refut) as pcp_med_refut label="Frequency count of Medication utterances of type Refutation for PCP",
SUM(CONTENT15.sp_med_refut) as sp_med_refut label="Frequency count of Medication utterances of type Refutation for SP",
SUM(CONTENT15.pcp_othertx_refut) as pcp_othertx_refut label="Frequency count of Other treatments utterances of type Refutation for PCP",
SUM(CONTENT15.sp_othertx_refut) as sp_othertx_refut label="Frequency count of Other treatments utterances of type Refutation for SP",
SUM(CONTENT15.pcp_emot_refut) as pcp_emot_refut label="Frequency count of Emotions utterances of type Refutation for PCP",
SUM(CONTENT15.sp_emot_refut) as sp_emot_refut label="Frequency count of Emotions utterances of type Refutation for SP",
SUM(CONTENT15.pcp_social_refut) as pcp_social_refut label="Frequency count of Social chitchat utterances of type Refutation for PCP",
SUM(CONTENT15.sp_social_refut) as sp_social_refut label="Frequency count of Social chitchat utterances of type Refutation for SP",
SUM(CONTENT15.pcp_closing_refut) as pcp_closing_refut label="Frequency count of Follow up and closing utterances of type Refutation for PCP",
SUM(CONTENT15.sp_closing_refut) as sp_closing_refut label="Frequency count of Follow up and closing utterances of type Refutation for SP",
SUM(CONTENT15.pcp_unint_refut) as pcp_unint_refut label="Frequency count of Unintelligible utterances of type Refutation for PCP",
SUM(CONTENT15.sp_unint_refut) as sp_unint_refut label="Frequency count of Unintelligible utterances of type Refutation for SP",
SUM(CONTENT15.pcp_bckch_refut) as pcp_bckch_refut label="Frequency count of Back Channel/Filler utterances of type Refutation for PCP",
SUM(CONTENT15.sp_bckch_refut) as sp_bckch_refut label="Frequency count of Back Channel/Filler utterances of type Refutation for SP",

SUM(CONTENT15.pcp_int_altru) as pcp_int_altru label="Frequency count of Introduction utterances of type Altruism for PCP",
SUM(CONTENT15.sp_int_altru) as sp_int_altru label="Frequency count of Introduction utterances of type Altruism for SP",
SUM(CONTENT15.pcp_medhist_altru) as pcp_medhist_altru label="Frequency count of Medical history utterances of type Altruism for PCP",
SUM(CONTENT15.sp_medhist_altru) as sp_medhist_altru label="Frequency count of Medical history utterances of type Altruism for SP",
SUM(CONTENT15.pcp_gimedhist_altru) as pcp_gimedhist_altru label="Frequency count of GI Medical history utterances of type Altruism for PCP",
SUM(CONTENT15.sp_gimedhist_altru) as sp_gimedhist_altru label="Frequency count of GI Medical history utterances of type Altruism for SP",
SUM(CONTENT15.pcp_fammedhist_altru) as pcp_fammedhist_altru label="Frequency count of Family medical history utterances of type Altruism for PCP",
SUM(CONTENT15.sp_fammedhist_altru) as sp_fammedhist_altru label="Frequency count of Family medical history utterances of type Altruism for SP",
SUM(CONTENT15.pcp_hlthbeh_altru) as pcp_hlthbeh_altru label="Frequency count of Health behaviors utterances of type Altruism for PCP",
SUM(CONTENT15.sp_hlthbeh_altru) as sp_hlthbeh_altru label="Frequency count of Health behaviors utterances of type Altruism for SP",
SUM(CONTENT15.pcp_pyschinfo_altru) as pcp_pyschinfo_altru label="Frequency count of Psychosocial information utterances of type Altruism for PCP",
SUM(CONTENT15.sp_pyschinfo_altru) as sp_pyschinfo_altru label="Frequency count of Psychosocial information utterances of type Altruism for SP",
SUM(CONTENT15.pcp_physexam_altru) as pcp_physexam_altru label="Frequency count of Physical exam utterances of type Altruism for PCP",
SUM(CONTENT15.sp_physexam_altru) as sp_physexam_altru label="Frequency count of Physical exam utterances of type Altruism for SP",
SUM(CONTENT15.pcp_sympt_altru) as pcp_sympt_altru label="Frequency count of Symptoms utterances of type Altruism for PCP",
SUM(CONTENT15.sp_sympt_altru) as sp_sympt_altru label="Frequency count of Symptoms utterances of type Altruism for SP",
SUM(CONTENT15.pcp_oript_altru) as pcp_oript_altru label="Frequency count of Orients patient utterances of type Altruism for PCP",
SUM(CONTENT15.sp_oript_altru) as sp_oript_altru label="Frequency count of Orients patient utterances of type Altruism for SP",
SUM(CONTENT15.pcp_fin_altru) as pcp_fin_altru label="Frequency count of Financial utterances of type Altruism for PCP",
SUM(CONTENT15.sp_fin_altru) as sp_fin_altru label="Frequency count of Financial utterances of type Altruism for SP",
SUM(CONTENT15.pcp_possdiag_altru) as pcp_possdiag_altru label="Frequency count of Possible diagnoses utterances of type Altruism for PCP",
SUM(CONTENT15.sp_possdiag_altru) as sp_possdiag_altru label="Frequency count of Possible diagnoses utterances of type Altruism for SP",
SUM(CONTENT15.pcp_ref_altru) as pcp_ref_altru label="Frequency count of Referrals utterances of type Altruism for PCP",
SUM(CONTENT15.sp_ref_altru) as sp_ref_altru label="Frequency count of Referrals utterances of type Altruism for SP",
SUM(CONTENT15.pcp_tests_altru) as pcp_tests_altru label="Frequency count of Tests offered utterances of type Altruism for PCP",
SUM(CONTENT15.sp_tests_altru) as sp_tests_altru label="Frequency count of Tests offered utterances of type Altruism for SP",
SUM(CONTENT15.pcp_med_altru) as pcp_med_altru label="Frequency count of Medication utterances of type Altruism for PCP",
SUM(CONTENT15.sp_med_altru) as sp_med_altru label="Frequency count of Medication utterances of type Altruism for SP",
SUM(CONTENT15.pcp_othertx_altru) as pcp_othertx_altru label="Frequency count of Other treatments utterances of type Altruism for PCP",
SUM(CONTENT15.sp_othertx_altru) as sp_othertx_altru label="Frequency count of Other treatments utterances of type Altruism for SP",
SUM(CONTENT15.pcp_emot_altru) as pcp_emot_altru label="Frequency count of Emotions utterances of type Altruism for PCP",
SUM(CONTENT15.sp_emot_altru) as sp_emot_altru label="Frequency count of Emotions utterances of type Altruism for SP",
SUM(CONTENT15.pcp_social_altru) as pcp_social_altru label="Frequency count of Social chitchat utterances of type Altruism for PCP",
SUM(CONTENT15.sp_social_altru) as sp_social_altru label="Frequency count of Social chitchat utterances of type Altruism for SP",
SUM(CONTENT15.pcp_closing_altru) as pcp_closing_altru label="Frequency count of Follow up and closing utterances of type Altruism for PCP",
SUM(CONTENT15.sp_closing_altru) as sp_closing_altru label="Frequency count of Follow up and closing utterances of type Altruism for SP",
SUM(CONTENT15.pcp_unint_altru) as pcp_unint_altru label="Frequency count of Unintelligible utterances of type Altruism for PCP",
SUM(CONTENT15.sp_unint_altru) as sp_unint_altru label="Frequency count of Unintelligible utterances of type Altruism for SP",
SUM(CONTENT15.pcp_bckch_altru) as pcp_bckch_altru label="Frequency count of Back Channel/Filler utterances of type Altruism for PCP",
SUM(CONTENT15.sp_bckch_altru) as sp_bckch_altru label="Frequency count of Back Channel/Filler utterances of type Altruism for SP",

SUM(CONTENT15.pcp_int_esteem) as pcp_int_esteem label="Frequency count of Introduction utterances of type Esteem for PCP",
SUM(CONTENT15.sp_int_esteem) as sp_int_esteem label="Frequency count of Introduction utterances of type Esteem for SP",
SUM(CONTENT15.pcp_medhist_esteem) as pcp_medhist_esteem label="Frequency count of Medical history utterances of type Esteem for PCP",
SUM(CONTENT15.sp_medhist_esteem) as sp_medhist_esteem label="Frequency count of Medical history utterances of type Esteem for SP",
SUM(CONTENT15.pcp_gimedhist_esteem) as pcp_gimedhist_esteem label="Frequency count of GI Medical history utterances of type Esteem for PCP",
SUM(CONTENT15.sp_gimedhist_esteem) as sp_gimedhist_esteem label="Frequency count of GI Medical history utterances of type Esteem for SP",
SUM(CONTENT15.pcp_fammedhist_esteem) as pcp_fammedhist_esteem label="Frequency count of Family Medical history utterances of type Esteem for PCP",
SUM(CONTENT15.sp_fammedhist_esteem) as sp_fammedhist_esteem label="Frequency count of Family Medical history utterances of type Esteem for SP",
SUM(CONTENT15.pcp_hlthbeh_esteem) as pcp_hlthbeh_esteem label="Frequency count of Health behaviors utterances of type Esteem for PCP",
SUM(CONTENT15.sp_hlthbeh_esteem) as sp_hlthbeh_esteem label="Frequency count of Health behaviors utterances of type Esteem for SP",
SUM(CONTENT15.pcp_pyschinfo_esteem) as pcp_pyschinfo_esteem label="Frequency count of Psychosocial information utterances of type Esteem for PCP",
SUM(CONTENT15.sp_pyschinfo_esteem) as sp_pyschinfo_esteem label="Frequency count of Psychosocial information utterances of type Esteem for SP",
SUM(CONTENT15.pcp_physexam_esteem) as pcp_physexam_esteem label="Frequency count of Physical exam utterances of type Esteem for PCP",
SUM(CONTENT15.sp_physexam_esteem) as sp_physexam_esteem label="Frequency count of Physical exam utterances of type Esteem for SP",
SUM(CONTENT15.pcp_sympt_esteem) as pcp_sympt_esteem label="Frequency count of Symptoms utterances of type Esteem for PCP",
SUM(CONTENT15.sp_sympt_esteem) as sp_sympt_esteem label="Frequency count of Symptoms utterances of type Esteem for PCP",
SUM(CONTENT15.pcp_oript_esteem) as pcp_oript_esteem label="Frequency count of Orients patient utterances of type Esteem for PCP",
SUM(CONTENT15.sp_oript_esteem) as sp_oript_esteem label="Frequency count of Orients patient utterances of type Esteem for SP",
SUM(CONTENT15.pcp_fin_esteem) as pcp_fin_esteem label="Frequency count of Financial utterances of type Esteem for PCP",
SUM(CONTENT15.sp_fin_esteem) as sp_fin_esteem label="Frequency count of Financial utterances of type Esteem for SP",
SUM(CONTENT15.pcp_possdiag_esteem) as pcp_possdiag_esteem label="Frequency count of Possible diagnoses utterances of type Esteem for PCP",
SUM(CONTENT15.sp_possdiag_esteem) as sp_possdiag_esteem label="Frequency count of Possible diagnoses utterances of type Esteem for SP",
SUM(CONTENT15.pcp_ref_esteem) as pcp_ref_esteem label="Frequency count of Referrals utterances of type Esteem for PCP",
SUM(CONTENT15.sp_ref_esteem) as sp_ref_esteem label="Frequency count of Referrals utterances of type Esteem for SP",
SUM(CONTENT15.pcp_tests_esteem) as pcp_tests_esteem label="Frequency count of Tests offered utterances of type Esteem for PCP",
SUM(CONTENT15.sp_tests_esteem) as sp_tests_esteem label="Frequency count of Tests offered utterances of type Esteem for SP",
SUM(CONTENT15.pcp_med_esteem) as pcp_med_esteem label="Frequency count of Medication utterances of type Esteem for PCP",
SUM(CONTENT15.sp_med_esteem) as sp_med_esteem label="Frequency count of Medication utterances of type Esteem for SP",
SUM(CONTENT15.pcp_othertx_esteem) as pcp_othertx_esteem label="Frequency count of Other treatments utterances of type Esteem for PCP",
SUM(CONTENT15.sp_othertx_esteem) as sp_othertx_esteem label="Frequency count of Other treatments utterances of type Esteem for SP",
SUM(CONTENT15.pcp_emot_esteem) as pcp_emot_esteem label="Frequency count of Emotions utterances of type Esteem for PCP",
SUM(CONTENT15.sp_emot_esteem) as sp_emot_esteem label="Frequency count of Emotions utterances of type Esteem for SP",
SUM(CONTENT15.pcp_social_esteem) as pcp_social_esteem label="Frequency count of Social chitchat utterances of type Esteem for PCP",
SUM(CONTENT15.sp_social_esteem) as sp_social_esteem label="Frequency count of Social chitchat utterances of type Esteem for SP",
SUM(CONTENT15.pcp_closing_esteem) as pcp_closing_esteem label="Frequency count of Follow up and closing utterances of type Esteem for PCP",
SUM(CONTENT15.sp_closing_esteem) as sp_closing_esteem label="Frequency count of Follow up and closing utterances of type Esteem for SP",
SUM(CONTENT15.pcp_unint_esteem) as pcp_unint_esteem label="Frequency count of Unintelligible utterances of type Esteem for PCP",
SUM(CONTENT15.sp_unint_esteem) as sp_unint_esteem label="Frequency count of Unintelligible utterances of type Esteem for SP",
SUM(CONTENT15.pcp_bckch_esteem) as pcp_bckch_esteem label="Frequency count of Back Channel/Filler utterances of type Esteem for PCP",
SUM(CONTENT15.sp_bckch_esteem) as sp_bckch_esteem label="Frequency count of Back Channel/Filler utterances of type Esteem for SP",

SUM(CONTENT15.pcp_int_guilt) as pcp_int_guilt label="Frequency count of Introduction utterances of type Guilt for PCP",
SUM(CONTENT15.sp_int_guilt) as sp_int_guilt label="Frequency count of Introduction utterances of type Guilt for SP",
SUM(CONTENT15.pcp_medhist_guilt) as pcp_medhist_guilt label="Frequency count of Medical History utterances of type Guilt for PCP",
SUM(CONTENT15.sp_medhist_guilt) as sp_medhist_guilt label="Frequency count of Medical History utterances of type Guilt for SP",
SUM(CONTENT15.pcp_fammedhist_guilt) as pcp_fammedhist_guilt label="Frequency count of Family Medical History utterances of type Guilt for PCP",
SUM(CONTENT15.sp_fammedhist_guilt) as sp_fammedhist_guilt label="Frequency count of Family Medical History utterances of type Guilt for SP",
SUM(CONTENT15.pcp_gimedhist_guilt) as pcp_gimedhist_guilt label="Frequency count of GI Medical History utterances of type Guilt for PCP",
SUM(CONTENT15.sp_gimedhist_guilt) as sp_gimedhist_guilt label="Frequency count of GI Medical History utterances of type Guilt for SP",
SUM(CONTENT15.pcp_hlthbeh_guilt) as pcp_hlthbeh_guilt label="Frequency count of Health Behaviors utterances of type Guilt for PCP",
SUM(CONTENT15.sp_hlthbeh_guilt) as sp_hlthbeh_guilt label="Frequency count of Health Behaviors utterances of type Guilt for SP",
SUM(CONTENT15.pcp_pyschinfo_guilt) as pcp_pyschinfo_guilt label="Frequency count of Psychosocial information utterances of type Guilt for PCP",
SUM(CONTENT15.sp_pyschinfo_guilt) as sp_pyschinfo_guilt label="Frequency count of Psychosocial information utterances of type Guilt for SP",
SUM(CONTENT15.pcp_physexam_guilt) as pcp_physexam_guilt label="Frequency count of Physical exam utterances of type Guilt for PCP",
SUM(CONTENT15.sp_physexam_guilt) as sp_physexam_guilt label="Frequency count of Physical exam utterances of type Guilt for SP",
SUM(CONTENT15.pcp_sympt_guilt) as pcp_sympt_guilt label="Frequency count of Symptoms utterances of type Guilt for PCP",
SUM(CONTENT15.sp_sympt_guilt) as sp_sympt_guilt label="Frequency count of Symptoms utterances of type Guilt for SP",
SUM(CONTENT15.pcp_oript_guilt) as pcp_oript_guilt label="Frequency count of Orients patient utterances of type Guilt for PCP",
SUM(CONTENT15.sp_oript_guilt) as sp_oript_guilt label="Frequency count of Orients patient utterances of type Guilt for SP",
SUM(CONTENT15.pcp_fin_guilt) as pcp_fin_guilt label="Frequency count of Financial utterances of type Guilt for PCP",
SUM(CONTENT15.sp_fin_guilt) as sp_fin_guilt label="Frequency count of Financial utterances of type Guilt for SP",
SUM(CONTENT15.pcp_possdiag_guilt) as pcp_possdiag_guilt label="Frequency count of Possible diagnoses utterances of type Guilt for PCP",
SUM(CONTENT15.sp_possdiag_guilt) as sp_possdiag_guilt label="Frequency count of Possible diagnoses utterances of type Guilt for SP",
SUM(CONTENT15.pcp_ref_guilt) as pcp_ref_guilt label="Frequency count of Referrals utterances of type Guilt for PCP",
SUM(CONTENT15.sp_ref_guilt) as sp_ref_guilt label="Frequency count of Referrals utterances of type Guilt for SP",
SUM(CONTENT15.pcp_tests_guilt) as pcp_tests_guilt label="Frequency count of Tests offered utterances of type Guilt for PCP",
SUM(CONTENT15.sp_tests_guilt) as sp_tests_guilt label="Frequency count of Tests offered utterances of type Guilt for SP",
SUM(CONTENT15.pcp_med_guilt) as pcp_med_guilt label ="Frequency count of Medication utterances of type Guilt for PCP",
SUM(CONTENT15.sp_med_guilt) as sp_med_guilt label ="Frequency count of Medication utterances of type Guilt for SP",
SUM(CONTENT15.pcp_othertx_guilt) as pcp_othertx_guilt label="Frequency count of Other treatments utterances of type Guilt for PCP",
SUM(CONTENT15.sp_othertx_guilt) as sp_othertx_guilt label="Frequency count of Other treatments utterances of type Guilt for SP",
SUM(CONTENT15.pcp_emot_guilt) as pcp_emot_guilt label="Frequency count of Emotions utterances of type Guilt for PCP",
SUM(CONTENT15.sp_emot_guilt) as sp_emot_guilt label="Frequency count of Emotions utterances of type Guilt for SP",
SUM(CONTENT15.pcp_social_guilt) as pcp_social_guilt label="Frequency count of Social Chitchat utterances of type Guilt for PCP",
SUM(CONTENT15.sp_social_guilt) as sp_social_guilt label="Frequency count of Social Chitchat utterances of type Guilt for SP",
SUM(CONTENT15.pcp_closing_guilt) as pcp_closing_guilt label ="Frequency count of Follow up and closing utterances of type Guilt for PCP",
SUM(CONTENT15.sp_closing_guilt) as sp_closing_guilt label="Frequency count of Follow up and closing utterances of type Guilt for SP",
SUM(CONTENT15.pcp_unint_guilt) as pcp_unint_guilt label="Frequency count of Unintelligible utterances of type Guilt for PCP",
SUM(CONTENT15.sp_unint_guilt) as sp_unint_guilt label="Frequency count of Unintelligible utterances of type Guilt for SP",
SUM(CONTENT15.pcp_bckch_guilt) as pcp_bckch_guilt label="Frequency count of Back Channel/Filler utterances of type Guilt for PCP",
SUM(CONTENT15.sp_bckch_guilt) as sp_bckch_guilt label="Frequency count of Back Channel/Filler utterances of type Guilt for SP",

SUM(CONTENT15.pcp_int_foot) as pcp_int_foot label="Frequency count of Introduction utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_int_foot) as sp_int_foot label="Frequency count of Introduction utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_medhist_foot) as pcp_medhist_foot label="Frequency count of Medical History utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_medhist_foot) as sp_medhist_foot label="Frequency count of Medical History utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_gimedhist_foot) as pcp_gimedhist_foot label="Frequency count of GI Medical History utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_gimedhist_foot) as sp_gimedhist_foot label="Frequency count of GI Medical History utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_fammedhist_foot) as pcp_fammedhist_foot label="Frequency count of Family Medical History utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_fammedhist_foot) as sp_fammedhist_foot label="Frequency count of Family Medical History utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_hlthbeh_foot) as pcp_hlthbeh_foot label="Frequency count of Health Behaviors utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_hlthbeh_foot) as sp_hlthbeh_foot label="Frequency count of Health Behaviors utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_pyschinfo_foot) as pcp_pyschinfo_foot label="Frequency count of Psychosocial information utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_pyschinfo_foot) as sp_pyschinfo_foot label="Frequency count of Psychosocial information utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_physexam_foot) as pcp_physexam_foot label="Frequency count of Physical exam utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_physexam_foot) as sp_physexam_foot label="Frequency count of Physical exam utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_sympt_foot) as pcp_sympt_foot label="Frequency count of Symptoms utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_sympt_foot) as sp_sympt_foot label="Frequency count of Symptoms utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_oript_foot) as pcp_oript_foot label="Frequency count of Orients patient utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_oript_foot) as sp_oript_foot label="Frequency count of Orients patient utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_fin_foot) as pcp_fin_foot label="Frequency count of Financial utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_fin_foot) as sp_fin_foot label ="Frequency count of Financial utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_possdiag_foot) as pcp_possdiag_foot label="Frequency count of Possible diagnoses utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_possdiag_foot) as sp_possdiag_foot label="Frequency count of Possible diagnoses utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_ref_foot) as pcp_ref_foot label="Frequency count of Referrals utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_ref_foot) as sp_ref_foot label="Frequency count of Referrals utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_tests_foot) as pcp_tests_foot label="Frequency count of Tests offered utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_tests_foot) as sp_tests_foot label="Frequency count of Tests offered utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_med_foot) as pcp_med_foot label="Frequency count of Medication utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_med_foot) as sp_med_foot label="Frequency count of Medication utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_othertx_foot) as pcp_othertx_foot label="Frequency count of Other treatments utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_othertx_foot) as sp_othertx_foot label="Frequency count of Other treatments utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_emot_foot) as pcp_emot_foot label="Frequency count of Emotions utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_emot_foot) as sp_emot_foot label="Frequency count of Emotions utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_social_foot) as pcp_social_foot label="Frequency count of Social Chitchat utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_social_foot) as sp_social_foot label="Frequency count of Social Chitchat utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_closing_foot) as pcp_closing_foot label="Frequency count of Follow up and closing utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_closing_foot) as sp_closing_foot label="Frequency count of Follow up and closing utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_unint_foot) as pcp_unint_foot label ="Frequency count of Unintelligible utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_unint_foot) as sp_unint_foot label="Frequency count of Unintelligible utterances of type Foot in the Door for SP",
SUM(CONTENT15.pcp_bckch_foot) as pcp_bckch_foot label="Frequency count of Back Channel/Filler utterances of type Foot in the Door for PCP",
SUM(CONTENT15.sp_bckch_foot) as sp_bckch_foot label="Frequency count of Back Channel/Filler utterances of type Foot in the Door for SP",

SUM(CONTENT15.pcp_int_threat) as pcp_int_threat label="Frequency count of Introduction utterances of type Threat for PCP",
SUM(CONTENT15.sp_int_threat) as sp_int_threat label="Frequency count of Introduction utterances of type Threat for SP",
SUM(CONTENT15.pcp_medhist_threat) as pcp_medhist_threat label="Frequency count of Medical History utterances of type Threat for PCP",
SUM(CONTENT15.sp_medhist_threat) as sp_medhist_threat label="Frequency count of Medical History utterances of type Threat for SP",
SUM(CONTENT15.pcp_gimedhist_threat) as pcp_gimedhist_threat label="Frequency count of GI Medical History utterances of type Threat for PCP",
SUM(CONTENT15.sp_gimedhist_threat) as sp_gimedhist_threat label="Frequency count of GI Medical History utterances of type Threat for SP",
SUM(CONTENT15.pcp_fammedhist_threat) as pcp_fammedhist_threat label="Frequency count of GI Medical History utterances of type Threat for PCP",
SUM(CONTENT15.sp_fammedhist_threat) as sp_fammedhist_threat label="Frequency count of Family Medical History utterances of type Threat for SP",
SUM(CONTENT15.pcp_hlthbeh_threat) as pcp_hlthbeh_threat label="Frequency count of Health Behaviors utterances of type Threat for PCP",
SUM(CONTENT15.sp_hlthbeh_threat) as sp_hlthbeh_threat label="Frequency count of Health Behaviors utterances of type Threat for SP",
SUM(CONTENT15.pcp_pyschinfo_threat) as pcp_pyschinfo_threat label="Frequency count of Psychosocial information utterances of type Threat for PCP",
SUM(CONTENT15.sp_pyschinfo_threat) as sp_pyschinfo_threat label="Frequency count of Psychosocial information utterances of type Threat for SP",
SUM(CONTENT15.pcp_physexam_threat) as pcp_physexam_threat label="Frequency count of Physical exam utterances of type Threat for PCP",
SUM(CONTENT15.sp_physexam_threat) as sp_physexam_threat label="Frequency count of Physical exam utterances of type Threat for SP",
SUM(CONTENT15.pcp_sympt_threat) as pcp_sympt_threat label="Frequency count of Symptoms utterances of type Threat for PCP",
SUM(CONTENT15.sp_sympt_threat) as sp_sympt_threat label="Frequency count of Symptoms utterances of type Threat for SP",
SUM(CONTENT15.pcp_oript_threat) as pcp_oript_threat label="Frequency count of Orients patient utterances of type Threat for PCP",
SUM(CONTENT15.sp_oript_threat) as sp_oript_threat label="Frequency count of Orients patient utterances of type Threat for SP",
SUM(CONTENT15.pcp_fin_threat) as pcp_fin_threat label="Frequency count of Financial utterances of type Threat for PCP",
SUM(CONTENT15.sp_fin_threat) as sp_fin_threat label="Frequency count of Financial utterances of type Threat for SP",
SUM(CONTENT15.pcp_possdiag_threat) as pcp_possdiag_threat label="Frequency count of Possible diagnoses utterances of type Threat for PCP",
SUM(CONTENT15.sp_possdiag_threat) as sp_possdiag_threat label="Frequency count of Possible diagnoses utterances of type Threat for SP",
SUM(CONTENT15.pcp_ref_threat) as pcp_ref_threat label="Frequency count of Referrals utterances of type Threat for PCP",
SUM(CONTENT15.sp_ref_threat) as sp_ref_threat label="Frequency count of Referrals utterances of type Threat for SP",
SUM(CONTENT15.pcp_tests_threat) as pcp_tests_threat label="Frequency count of Tests offered utterances of type Threat for PCP",
SUM(CONTENT15.sp_tests_threat) as sp_tests_threat label="Frequency count of Tests offered utterances of type Threat for SP",
SUM(CONTENT15.pcp_med_threat) as pcp_med_threat label="Frequency count of Medication utterances of type Threat for PCP",
SUM(CONTENT15.sp_med_threat) as sp_med_threat label="Frequency count of Medication utterances of type Threat for SP",
SUM(CONTENT15.pcp_othertx_threat) as pcp_othertx_threat label="Frequency count of Other treatments utterances of type Threat for PCP",
SUM(CONTENT15.sp_othertx_threat) as sp_othertx_threat label="Frequency count of Other treatments utterances of type Threat for SP",
SUM(CONTENT15.pcp_emot_threat) as pcp_emot_threat label="Frequency count of Emotions utterances of type Threat for PCP",
SUM(CONTENT15.sp_emot_threat) as sp_emot_threat label="Frequency count of Emotions utterances of type Threat for SP",
SUM(CONTENT15.pcp_social_threat) as pcp_social_threat label="Frequency count of Social Chitchat utterances of type Threat for PCP",
SUM(CONTENT15.sp_social_threat) as sp_social_threat label="Frequency count of Social Chitchat utterances of type Threat for SP",
SUM(CONTENT15.pcp_closing_threat) as pcp_closing_threat label="Frequency count of Follow up and closing utterances of type Threat for PCP",
SUM(CONTENT15.sp_closing_threat) as sp_closing_threat label="Frequency count of Follow up and closing utterances of type Threat for SP",
SUM(CONTENT15.pcp_unint_threat) as pcp_unint_threat label="Frequency count of Unintelligible utterances of type Threat for PCP",
SUM(CONTENT15.sp_unint_threat) as sp_unint_threat label="Frequency count of Unintelligible utterances of type Threat for SP",
SUM(CONTENT15.pcp_bckch_threat) as pcp_bckch_threat label="Frequency count of Back Channel/Filler utterances of type Threat for PCP",
SUM(CONTENT15.sp_bckch_threat) as sp_bckch_threat label="Frequency count of Back Channel/Filler utterances of type Threat for SP",

SUM(CONTENT15.pcp_int_approval) as pcp_int_approval label="Frequency count of Introduction utterances of type Approval for PCP",
SUM(CONTENT15.sp_int_approval) as sp_int_approval label="Frequency count of Introduction utterances of type Approval for SP",
SUM(CONTENT15.pcp_medhist_approval) as pcp_medhist_approval label="Frequency count of Medical History utterances of type Approval for PCP",
SUM(CONTENT15.sp_medhist_approval) as sp_medhist_approval label="Frequency count of Medical History utterances of type Approval for SP",
SUM(CONTENT15.pcp_gimedhist_approval) as pcp_gimedhist_approval label="Frequency count of GI Medical History utterances of type Approval for PCP",
SUM(CONTENT15.sp_gimedhist_approval) as sp_gimedhist_approval label="Frequency count of GI Medical History utterances of type Approval for SP",
SUM(CONTENT15.pcp_fammedhist_approval) as pcp_fammedhist_approval label="Frequency count of Family Medical History utterances of type Approval for PCP",
SUM(CONTENT15.sp_fammedhist_approval) as sp_fammedhist_approval label="Frequency count of Family Medical History utterances of type Approval for SP",
SUM(CONTENT15.pcp_hlthbeh_approval) as pcp_hlthbeh_approval label="Frequency count of Health Behaviors utterances of type Approval for PCP",
SUM(CONTENT15.sp_hlthbeh_approval) as sp_hlthbeh_approval label="Frequency count of Health Behaviors utterances of type Approval for SP",
SUM(CONTENT15.pcp_pyschinfo_approval) as pcp_pyschinfo_approval label="Frequency count of Psychosocial information utterances of type Approval for PCP",
SUM(CONTENT15.sp_pyschinfo_approval) as sp_pyschinfo_approval label="Frequency count of Psychosocial information utterances of type Approval for SP",
SUM(CONTENT15.pcp_physexam_approval) as pcp_physexam_approval label="Frequency count of Physical exam utterances of type Approval for PCP",
SUM(CONTENT15.sp_physexam_approval) as sp_physexam_approval label="Frequency count of Physical exam utterances of type Approval for SP",
SUM(CONTENT15.pcp_sympt_approval) as pcp_sympt_approval label="Frequency count of Symptoms utterances of type Approval for PCP",
SUM(CONTENT15.sp_sympt_approval) as sp_sympt_approval label="Frequency count of Symptoms utterances of type Approval for SP",
SUM(CONTENT15.pcp_oript_approval) as pcp_oript_approval label="Frequency count of Orients patient utterances of type Approval for PCP",
SUM(CONTENT15.sp_oript_approval) as sp_oript_approval label="Frequency count of Orients patient utterances of type Approval for SP",
SUM(CONTENT15.pcp_fin_approval) as pcp_fin_approval label="Frequency count of Financial utterances of type Approval for PCP",
SUM(CONTENT15.sp_fin_approval) as sp_fin_approval label="Frequency count of Financial utterances of type Approval for SP",
SUM(CONTENT15.pcp_possdiag_approval) as pcp_possdiag_approval label="Frequency count of Possible diagnoses utterances of type Approval for PCP",
SUM(CONTENT15.sp_possdiag_approval) as sp_possdiag_approval label="Frequency count of Possible diagnoses utterances of type Approval for SP",
SUM(CONTENT15.pcp_ref_approval) as pcp_ref_approval label ="Frequency count of Referrals utterances of type Approval for PCP",
SUM(CONTENT15.sp_ref_approval) as sp_ref_approval label="Frequency count of Referrals utterances of type Approval for SP",
SUM(CONTENT15.pcp_tests_approval) as pcp_tests_approval label="Frequency count of Tests offered utterances of type Approval for PCP",
SUM(CONTENT15.sp_tests_approval) as sp_tests_approval label="Frequency count of Tests offered utterances of type Approval for SP",
SUM(CONTENT15.pcp_med_approval) as pcp_med_approval label="Frequency count of Medication utterances of type Approval for PCP",
SUM(CONTENT15.sp_med_approval) as sp_med_approval label="Frequency count of Medication utterances of type Approval for SP",
SUM(CONTENT15.pcp_othertx_approval) as pcp_othertx_approval label="Frequency count of Other treatments utterances of type Approval for PCP",
SUM(CONTENT15.sp_othertx_approval) as sp_othertx_approval label="Frequency count of Other treatments utterances of type Approval for SP",
SUM(CONTENT15.pcp_emot_approval) as pcp_emot_approval label="Frequency count of Emotions utterances of type Approval for PCP",
SUM(CONTENT15.sp_emot_approval) as sp_emot_approval label="Frequency count of Emotions utterances of type Approval for SP",
SUM(CONTENT15.pcp_social_approval) as pcp_social_approval label="Frequency count of Social Chitchat utterances of type Approval for PCP",
SUM(CONTENT15.sp_social_approval) as sp_social_approval label="Frequency count of Social Chitchat utterances of type Approval for SP",
SUM(CONTENT15.pcp_closing_approval) as pcp_closing_approval label="Frequency count of Follow up and closing utterances of type Approval for PCP",
SUM(CONTENT15.sp_closing_approval) as sp_closing_approval label="Frequency count of Follow up and closing utterances of type Approval for SP",
SUM(CONTENT15.pcp_unint_approval) as pcp_unint_approval label="Frequency count of Unintelligible utterances of type Approval for PCP",
SUM(CONTENT15.sp_unint_approval) as sp_unint_approval label="Frequency count of Unintelligible utterances of type Approval for SP",
SUM(CONTENT15.pcp_bckch_approval) as pcp_bckch_approval label="Frequency count of Back Channel/Filler utterances of type Approval for PCP",
SUM(CONTENT15.sp_bckch_approval) as sp_bckch_approval label="Frequency count of Back Channel/Filler utterances of type Approval for SP",

SUM(CONTENT15.pcp_int_repeat) as pcp_int_repeat label="Frequency count of Introduction utterances of type Repetition for PCP",
SUM(CONTENT15.sp_int_repeat) as sp_int_repeat label="Frequency count of Introduction utterances of type Repetition for SP",
SUM(CONTENT15.pcp_medhist_repeat) as pcp_medhist_repeat label="Frequency count of Medical History utterances of type Repetition for PCP",
SUM(CONTENT15.sp_medhist_repeat) as sp_medhist_repeat label="Frequency count of Medical History utterances of type Repetition for SP",
SUM(CONTENT15.pcp_gimedhist_repeat) as pcp_gimedhist_repeat label="Frequency count of GI Medical History utterances of type Repetition for PCP",
SUM(CONTENT15.sp_gimedhist_repeat) as sp_gimedhist_repeat label="Frequency count of GI Medical History utterances of type Repetition for SP",
SUM(CONTENT15.pcp_fammedhist_repeat) as pcp_fammedhist_repeat label="Frequency count of Family Medical History utterances of type Repetition for PCP",
SUM(CONTENT15.sp_fammedhist_repeat) as sp_fammedhist_repeat label="Frequency count of Family Medical History utterances of type Repetition for SP",
SUM(CONTENT15.pcp_hlthbeh_repeat) as pcp_hlthbeh_repeat label="Frequency count of Health Behaviors utterances of type Repetition for PCP",
SUM(CONTENT15.sp_hlthbeh_repeat) as sp_hlthbeh_repeat label="Frequency count of Health Behaviors utterances of type Repetition for SP",
SUM(CONTENT15.pcp_pyschinfo_repeat) as pcp_pyschinfo_repeat label="Frequency count of Psychosocial information utterances of type Repetition for PCP",
SUM(CONTENT15.sp_pyschinfo_repeat) as sp_pyschinfo_repeat label="Frequency count of Psychosocial information utterances of type Repetition for SP",
SUM(CONTENT15.pcp_physexam_repeat) as pcp_physexam_repeat label="Frequency count of Physical exam utterances of type Repetition for PCP",
SUM(CONTENT15.sp_physexam_repeat) as sp_physexam_repeat label="Frequency count of Physical exam utterances of type Repetition for SP",
SUM(CONTENT15.pcp_sympt_repeat) as pcp_sympt_repeat label="Frequency count of Symptoms utterances of type Repetition for PCP",
SUM(CONTENT15.sp_sympt_repeat) as sp_sympt_repeat label="Frequency count of Symptoms utterances of type Repetition for SP",
SUM(CONTENT15.pcp_oript_repeat) as pcp_oript_repeat label="Frequency count of Orients patient utterances of type Repetition for PCP",
SUM(CONTENT15.sp_oript_repeat) as sp_oript_repeat label="Frequency count of Orients patient utterances of type Repetition for SP",
SUM(CONTENT15.pcp_fin_repeat) as pcp_fin_repeat label="Frequency count of Financial utterances of type Repetition for PCP",
SUM(CONTENT15.sp_fin_repeat) as sp_fin_repeat label="Frequency count of Financial utterances of type Repetition for SP",
SUM(CONTENT15.pcp_possdiag_repeat) as pcp_possdiag_repeat label="Frequency count of Possible diagnoses utterances of type Repetition for PCP",
SUM(CONTENT15.sp_possdiag_repeat) as sp_possdiag_repeat label="Frequency count of Possible diagnoses utterances of type Repetition for SP",
SUM(CONTENT15.pcp_ref_repeat) as pcp_ref_repeat label="Frequency count of Referrals utterances of type Repetition for PCP",
SUM(CONTENT15.sp_ref_repeat) as sp_ref_repeat label="Frequency count of Referrals utterances of type Repetition for SP",
SUM(CONTENT15.pcp_tests_repeat) as pcp_tests_repeat label="Frequency count of Tests offered utterances of type Repetition for PCP",
SUM(CONTENT15.sp_tests_repeat) as sp_tests_repeat label="Frequency count of Tests offered utterances of type Repetition for SP",
SUM(CONTENT15.pcp_med_repeat) as pcp_med_repeat label="Frequency count of Medication utterances of type Repetition for PCP",
SUM(CONTENT15.sp_med_repeat) as sp_med_repeat label="Frequency count of Medication utterances of type Repetition for SP",
SUM(CONTENT15.pcp_othertx_repeat) as pcp_othertx_repeat label="Frequency count of Other treatments utterances of type Repetition for PCP",
SUM(CONTENT15.sp_othertx_repeat) as sp_othertx_repeat label="Frequency count of Other treatments utterances of type Repetition for SP",
SUM(CONTENT15.pcp_emot_repeat) as pcp_emot_repeat label="Frequency count of Emotions utterances of type Repetition for PCP",
SUM(CONTENT15.sp_emot_repeat) as sp_emot_repeat label="Frequency count of Emotions utterances of type Repetition for SP",
SUM(CONTENT15.pcp_social_repeat) as pcp_social_repeat label="Frequency count of Social Chitchat utterances of type Repetition for PCP",
SUM(CONTENT15.sp_social_repeat) as sp_social_repeat label="Frequency count of Social Chitchat utterances of type Repetition for SP",
SUM(CONTENT15.pcp_closing_repeat) as pcp_closing_repeat label="Frequency count of Follow up and closing utterances of type Repetition for PCP",
SUM(CONTENT15.sp_closing_repeat) as sp_closing_repeat label="Frequency count of Follow up and closing utterances of type Repetition for SP",
SUM(CONTENT15.pcp_unint_repeat) as pcp_unint_repeat  label="Frequency count of Unintelligible utterances of type Repetition for PCP",
SUM(CONTENT15.sp_unint_repeat) as sp_unint_repeat label="Frequency count of Unintelligible utterances of type Repetition for SP",
SUM(CONTENT15.pcp_bckch_repeat) as pcp_bckch_repeat label="Frequency count of Back Channel/Filler utterances of type Repetition for PCP",
SUM(CONTENT15.sp_bckch_repeat) as sp_bckch_repeat label="Frequency count of Back Channel/Filler utterances of type Repetition for SP"
from WORK.CONTENT15
group by CONTENT15.case_id;

data work.content20;
   merge work.content_merge1 work.content_merge2 work.content_merge4 content_merge3;
   by case_id;
run;

data work.sccap_master;
   merge work.sccap work.content20;
   by case_id;
   run;

PROC EXPORT DATA= WORK.sccap_master
            OUTFILE= "C:\Users\somloaner\Desktop\sccap_master.sav"
            DBMS=SAV REPLACE;
RUN;

PROC EXPORT DATA= WORK.content_comm_desc_merge
            OUTFILE= "C:\Users\somloaner\Desktop\content_commtype_decision.sav"
            DBMS=SAV REPLACE;
RUN;
