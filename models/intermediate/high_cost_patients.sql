with 

patient as (select * from {{ ref('stg_clinic__patients') }}), 

encounters as (select * from {{ ref('stg_clinic__encounters') }})

select
  patient.patient_id,
  patient.last_name,
  sum(encounters.total_claim_cost) as total_cost

from patient
join encounters
  on patient.patient_id = encounters.patient_id 
where patient.death_date is null

group by patient.patient_id, patient.last_name

having sum(encounters.total_claim_cost) > 100000