Alias: $sct = http://snomed.info/sct
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category


ValueSet: BreastQuadrants
Id: breast-quadrant
Title: "Breast quadrant locations"
Description: "HL7 LT SNOMED value set for smoking status."
* ^language = #en
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#110496004 "Structure of upper outer quadrant of right breast (body structure)"
* $sct#110497008 "Structure of lower outer quadrant of right breast (body structure)"
* $sct#110495000 "Structure of lower inner quadrant of right breast (body structure)"
* $sct#110494001 "Structure of upper inner quadrant of right breast (body structure)"

* $sct#110501003 "Structure of upper outer quadrant of left breast (body structure)"
* $sct#110502005 "Structure of lower outer quadrant of left breast (body structure)"
* $sct#110500002 "Structure of lower inner quadrant of left breast (body structure)"
* $sct#110499006 "Structure of upper inner quadrant of left breast (body structure)"

ValueSet: YesNo
Id: yes-no
Title: "Yes-No options"
Description: "Selection Yes or No."
* ^status = #active
* ^experimental = false
* ^language = #en
* ^publisher = "HL7 Lithuania"
// No
* $sct#373067005 "No (qualifier value)"
// Yes
* $sct#373066001 "Yes (qualifier value)"

ValueSet: NippleInversion
Id: nipple-inversion
Title: "Side of the nipple"
Description: "The side of the nipple inversion."
* ^status = #active
* ^experimental = false
* ^language = #en
* ^publisher = "HL7 Lithuania"
// No
* $sct#15953221000119100 "Retraction of left nipple (finding)"
// Yes
* $sct#15953181000119108 "Retraction of right nipple (finding)"







Profile: LTSkinFormations
Parent: LTBaseObservation
Id: lt-skin-formations
Title: "Breast Skin Formations"
Description: "This profile constrains the Observation resource to represent breast skin formations assessment in a patient summary."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* category = $observation-category#social-history "Social History"
* code = $sct#297960002 "Mass of skin (finding)"
* subject 1..
* subject only Reference(LTBasePatient)
* effective[x] 1..
* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from BreastQuadrants (preferred)
* component ..0

Profile: LTScars
Parent: LTBaseObservation
Id: lt-scars
Title: "Breast Scars"
Description: "This profile constrains the Observation resource to represent breast scars assessment in a patient summary."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* category = $observation-category#social-history "Social History"
* code = $sct#442523003 "Surgical scar finding (finding)"
* subject 1..
* subject only Reference(LTBasePatient)
* effective[x] 1..
* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from BreastQuadrants (preferred)
* component ..0

Profile: LTNippleInversion
Parent: LTBaseObservation
Id: lt-nipple-inversion
Title: "Nipple Inversion"
Description: "This profile constrains the Observation resource to represent breast nipple inversion assessment in a patient summary."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* category = $observation-category#social-history "Social History"
* code = $sct#271955004 "Retraction of nipple (finding)"
* subject 1..
* subject only Reference(LTBasePatient)
* effective[x] 1..
* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from BreastQuadrants (preferred)
* component ..0

