ValueSet: BreastFindingsVS
Id: lt-breast-findings-vs
Title: "Breast Findings Value Set"
Description: "Breast findings"
* ^language = #en
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#297960002 "Mass of skin (finding)"
* $sct#442523003 "Surgical scar finding (finding)"
* $sct#373572006 "Clinical finding absent (situation)"


Profile: LTSkinFormations2
Parent: LTBaseObservation
Id: lt-skin-formations2
Title: "Breast Skin Formations"
Description: "This profile constrains the Observation resource to represent breast skin formations assessment in a patient summary."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* category = $observation-category#exam "Exam"
* code = $sct#364370007 "Breast observable (observable entity)"
* subject 1..
* subject only Reference(LTBasePatient)
* effective[x] 1..
* effective[x] only dateTime
* bodyStructure only Reference(BodyStructureBreastLt)
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from BreastFindingsVS (preferred)
* component ..0

Profile: BodyStructureBreastLt
Parent: BodyStructureEuCore
Id: body-structure-breast-lt
Title: "Body Structure Breast LT"
Description: "This profile constrains the BodyStructure resource to represent the breast structure"

* includedStructure MS
* includedStructure.structure from BreastQuadrantVS (required)
* includedStructure.structure MS
* includedStructure.laterality 1..1 MS
* includedStructure.laterality from SiteLateralityEuVs (required)
* includedStructure.qualifier 0..0


Instance: lt-skin-formations2-body-structure-example
InstanceOf: BodyStructureEuCore
Title: "Example Body Structure for Breast Skin Formations"
Description: "An example instance of a body structure representing the breast for skin formations observation."
* id = "example-breast-structure"
* patient = Reference(LTBasePatient/example-patient)
* includedStructure[0].laterality = $sct#7771000 "Left (qualifier value)"
* includedStructure[=].structure = $sct#110501003 "Structure of upper outer quadrant of left breast (body structure)"
* includedStructure[+].laterality = $sct#24028007 "Right (qualifier value)"
* includedStructure[=].structure = $sct#110494001 "Structure of upper inner quadrant of right breast (body structure)"


Instance: lt-body-structure-inline-example
InstanceOf: BodyStructureEuCore
Title: "Example Body Structure"
Usage: #inline
Description: "An example instance of a body structure representing the breast for skin formations observation."
* id = "example-breast-structure"
* patient = Reference(LTBasePatient/example-patient)
* includedStructure[0].laterality = $sct#7771000 "Left (qualifier value)"
* includedStructure[=].structure = $sct#110501003 "Structure of upper outer quadrant of left breast (body structure)"
* includedStructure[+].laterality = $sct#24028007 "Right (qualifier value)"
* includedStructure[=].structure = $sct#110494001 "Structure of upper inner quadrant of right breast (body structure)"


Instance: lt-skin-formations-example2
InstanceOf: lt-skin-formations2
Title: "Example Breast Skin Formations Observation"
Description: "An example instance of a breast skin formations observation."
* status = #final
* subject = Reference(LTBasePatient/example-patient)
* effectiveDateTime = "2024-06-15T10:00:00+03:00"
* contained[0] = lt-body-structure-inline-example 
* bodyStructure.reference = "#lt-body-structure-inline-example"
* valueCodeableConcept = $sct#373066001 "Yes (qualifier value)"




Instance: lt-body-structure-inline-example3
InstanceOf: BodyStructureEuCore
Title: "Example Body Structure"
Usage: #inline
Description: "An example instance of a body structure representing the breast for skin formations observation."
* id = "example-breast-structure"
* patient = Reference(LTBasePatient/example-patient)
* includedStructure[0].laterality = $sct#7771000 "Left (qualifier value)"
* includedStructure[=].structure = $sct#76365002 "Structure of upper outer quadrant of breast (body structure)"
* includedStructure[+].laterality = $sct#24028007 "Right (qualifier value)"
* includedStructure[=].structure = $sct#110494001 "Structure of upper inner quadrant of breast (body structure)"


Instance: lt-skin-formations-example3
InstanceOf: lt-skin-formations2
Title: "Example Breast Skin Formations Observation 3"
Description: "An example instance of a breast skin formations observation (3)."
* status = #final
* subject = Reference(LTBasePatient/example-patient)
* effectiveDateTime = "2024-06-15T10:00:00+03:00"
* contained[0] = lt-body-structure-inline-example3 
* bodyStructure.reference = "#lt-body-structure-inline-example3"
* valueCodeableConcept = $sct#373066001 "Yes (qualifier value)"


