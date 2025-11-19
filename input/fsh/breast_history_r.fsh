Alias: $sct = http://snomed.info/sct
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

ValueSet: BreastQuadrantVS
Id: lt-breast-quadrant-vs
Title: "Breast Quadrant Value Set"
Description: "Breast quadrant"
* ^language = #en
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#76365002 "Structure of upper outer quadrant of breast (body structure)"
* $sct#33564002 "Structure of lower outer quadrant of breast (body structure)"
* $sct#19100000 "Structure of lower inner quadrant of breast (body structure)"
* $sct#110494001 "Structure of upper inner quadrant of breast (body structure)"

ValueSet: BreastSideVs
Id: lt-breast-side-vs
Title: "Breast Side Value Set"
Description: "Breast side"
* ^language = #en
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#80248007 "Left Breast Structure (body structure)"
* $sct#73056007 "Rigth Breast Structure (body structure)"

// ValueSet: YesNo
// Id: yes-no
// Title: "Yes-No options"
// Description: "Selection Yes or No."
// * ^status = #active
// * ^experimental = false
// * ^language = #en
// * ^publisher = "HL7 Lithuania"
// * $sct#373067005 "No (qualifier value)"
// * $sct#373066001 "Yes (qualifier value)"

Profile: LTBreastHistoryBase
Parent: LTBaseObservation
Id: lt-breast-history-base
Title: "Breast History Base"
Description: "This profile constrains the Observation resource to represent an observation about a breast history item."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^abstract = true
* ^publisher = "HL7 Lithuania"

// constrain category
* category = $observation-category#survey "Survey"

// define yes-no value
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from YesNo (required)

// Optional structured components
* component 0..*
* component ^short = "Additional details if value = Yes"

// Define slicing
* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false

* component contains Side 1..1 and Quadrant 1..1

* component[Side].code = $sct#76752008 "Breast structure (body structure)"
* component[Side].value[x] only CodeableConcept
* component[Side].valueCodeableConcept 1..1
* component[Side].valueCodeableConcept from BreastSideVs (required)
* component[Side] ^short = "Breast side where surgery was performed"

* component[Quadrant].code = $sct#272670002 "Structure of breast quadrant (body structure)"
* component[Quadrant].value[x] only CodeableConcept
* component[Quadrant].valueCodeableConcept 1..1
* component[Quadrant].valueCodeableConcept from BreastQuadrantVS (required)
* component[Quadrant] ^short = "Breast quadrant where surgery was performed"


Profile: LTBreastSurgeryHistory
Parent: lt-breast-history-base
Id: lt-breast-surgery-history
Title: "Breast Surgery History"
Description: "This profile constrains the Observation resource to represent a breast surgery history item."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"

// constrain code
* code = $sct#71661000210109 "History of operation on breast (situation)"

// optional note
* note 0..1
* note.text ^short = "Optional free-text note describing details"
// TODO: add years from surgery component


Profile: LTBreastInjuryHistory
Parent: lt-breast-history-base
Id: lt-breast-injury-history
Title: "Breasy Injury History"
Description: "This profile constrains the Observation resource to represent a breast injury history item."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"

// constrain code
* code = $sct#71661000210109 "History of injury on breast (situation)" // TODO: find correct code


Profile: LTBreastDiseaseHistory
Parent: lt-breast-history-base
Id: lt-breast-disease-history
Title: "Breast Disease History"
Description: "This profile constrains the Observation resource to represent a breast disease history item."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"

// constrain code
* code = $sct#71661000210109 "History of disease on breast (situation)" // TODO: find correct code


// Example for LTBreastSurgeryHistory
Instance: ExampleBreastSurgeryHistory
InstanceOf: lt-breast-surgery-history
Usage: #example
Title: "Example – Breast Surgery History"
Description: "Patient has a history of left breast surgery in the upper outer quadrant."
* status = #final

* valueCodeableConcept = $sct#373066001 "Yes (qualifier value)"
* note.text = "Lumpectomy of the left breast UOQ in 2018."

* component[Side].code = $sct#76752008 "Breast structure (body structure)"
* component[Side].valueCodeableConcept = $sct#80248007 "Left Breast Structure (body structure)"

* component[Quadrant].code = $sct#272670002 "Structure of breast quadrant (body structure)"
* component[Quadrant].valueCodeableConcept = $sct#76365002 "Structure of upper outer quadrant of breast (body structure)"


// Example for LTBreastInjuryHistory
Instance: ExampleBreastInjuryHistory
InstanceOf: lt-breast-injury-history
Usage: #example
Title: "Example – Breast Injury History"
Description: "Patient has a history of contusion of the left lower inner quadrant."
* status = #final
* valueCodeableConcept = $sct#373067005 "No (qualifier value)"

* component[Side].code = $sct#76752008 "Breast structure (body structure)"
* component[Side].valueCodeableConcept = $sct#73056007 "Right Breast Structure (body structure)"

* component[Quadrant].code = $sct#272670002 "Structure of breast quadrant (body structure)"
* component[Quadrant].valueCodeableConcept = $sct#33564002 "Structure of lower outer quadrant of breast (body structure)"

// Example for LTBreastDiseaseHistory
Instance: ExampleBreastDiseaseHistory
InstanceOf: lt-breast-disease-history
Usage: #example
Title: "Example – Breast Disease History"
Description: "Patient has a history of breast disease in the right lower outer quadrant."
* status = #final
* valueCodeableConcept = $sct#373066001 "Yes (qualifier value)"

* component[Side].code = $sct#76752008 "Breast structure (body structure)"
* component[Side].valueCodeableConcept = $sct#73056007 "Right Breast Structure (body structure)"

* component[Quadrant].code = $sct#272670002 "Structure of breast quadrant (body structure)"
* component[Quadrant].valueCodeableConcept = $sct#33564002 "Structure of lower outer quadrant of breast (body structure)"
