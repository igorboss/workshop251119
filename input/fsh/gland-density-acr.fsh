Alias: $sct = http://snomed.info/sct
Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

ValueSet: LTGlandDensityACR
Id: lt-gland-density-acr
Title: "Gland Density ACR"
Description: "ACR (BI-RADS) glandular density assessment"
* ^language = #en
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#129716005 "Almost entirely fat breast composition (finding)"
* $sct#129717001 "Mammographic breast composition showing scattered fibroglandular densities (finding)"
* $sct#129718006 "Heterogeneously dense breast composition (finding)"
* $sct#129719003 "Extremely dense breast composition (finding)"

ValueSet: BreastSide
Id: lt-breast-side
Title: "Breast Side"
Description: "Breast side (left or right)"
* ^language = #en
* ^version = "1.0.0"
* ^status = #active
* ^experimental = true
* ^publisher = "HL7 Lithuania"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* $sct#73056007 "Right breast structure (body structure)"
* $sct#80248007 "Left breast structure (body structure)"

Profile: LTGlandDensity
Parent: LTBaseObservation
Id: lt-gland-density
Title: "Gland density"
Description: "Gland density observation according to ACR BI-RADS classification."
* ^status = #draft
* ^language = #en
* ^version = "1.0.0"
* ^date = "2025-10-25T19:10:07+03:00"
* ^experimental = true
* ^publisher = "HL7 Lithuania"

// Category and code
* category = $observation-category#social-history "Social History"
* code = $sct#733851004 "Breast consistency (observable entity)" 

// Subject and timing
* subject 1..
* subject only Reference(LTBasePatient)
* effective[x] 1..
* effective[x] only dateTime

// Value of this Observation
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept from LTGlandDensityACR (preferred)

// Optional element
* component 0..*
* component ^short = "Optional additional details"
* component ^definition = "Optional additional tobacco-related information if needed."
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
// Optional component slice for a free-text detail
* component contains BreastSide 0..1
* component[BreastSide].code = $sct#73056007 "Right breast structure (body structure)"
* component[BreastSide].value[x] only string
* component[BreastSide].valueString ^short = "Body Site Detail"


Instance: fatty-acr-1-right-breast
InstanceOf: LTGlandDensity
Usage: #example
Title: "Example of Breast Density – Fatty"
Description: "Example showing a patient with fatty breast density."
* status = #final
* category = $observation-category#social-history "Social History"
* code = $sct#733851004 "Breast consistency (observable entity)"
* subject = Reference(example-patient)
* effectiveDateTime = "2025-10-01T09:00:00Z"
* valueCodeableConcept = $sct#129716005 "Almost entirely fat breast composition (finding)"  
* note.text = "Mammography shows fatty breast density."