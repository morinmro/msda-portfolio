-- D211 Advanced Data Acquisition: load external broadband dataset into PostgreSQL and aggregate for Tableau

-- Create Table
CREATE TABLE public.brdbnd_acs(
full_name text primary key,
county text,
state text,
state_abr text,
population numeric,
unemp numeric,
health_ins numeric,
poverty numeric,
SNAP numeric,
no_comp numeric,
no_internet numeric,
home_broad numeric,
broad_num numeric,
broad_avail numeric,
broad_cost numeric,
population_bbn numeric,
price_bbn numeric,
wired_bbn numeric,
provide_bbn numeric,
all25_bbn numeric,
downave_bbn numeric,
access_bbn numeric,
slowfrac_bbn numeric
)

-- Give table ownership to user
ALTER TABLE public.brdbnd_acs OWNER TO postgres;

-- Populate table with data from broadband_access csv file
COPY brdbnd_acs
FROM 'C:\Users\Public\Documents\broadband_access.csv'
DELIMITER ','
CSV HEADER;


SELECT "brdbnd_acs"."state_abr",
AVG("brdbnd_acs"."access_bbn") as "Avg_State_Brdbnd_Acs"
FROM "public"."brdbnd_acs"
WHERE "brdbnd_acs"."access_bbn" IS NOT NULL
GROUP BY "brdbnd_acs"."state_abr"


