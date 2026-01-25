-- Add new Zurich Tourism API fields to landmarks table
-- Run this migration in your Supabase SQL Editor

-- Disambiguating description and content fields
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS disambiguating_description TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS title_teaser TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS text_teaser TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS detailed_information TEXT[];

-- Zurich Card fields
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS zurich_card_description TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS zurich_card BOOLEAN DEFAULT FALSE;

-- Categories from API (array of category names)
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS api_categories TEXT[];

-- Image caption
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS image_caption TEXT;

-- Price
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS price TEXT;

-- Date modified from API
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS date_modified TEXT;

-- Opening hours fields
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS opens TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS opening_hours_specification JSONB;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS special_opening_hours TEXT;

-- Address fields
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS address_country TEXT;

-- Place field
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS place TEXT;

-- Photo gallery (up to 3 photos with captions)
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS photo_0_url TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS photo_0_caption TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS photo_1_url TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS photo_1_caption TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS photo_2_url TEXT;
ALTER TABLE landmarks ADD COLUMN IF NOT EXISTS photo_2_caption TEXT;

-- Add comments for documentation
COMMENT ON COLUMN landmarks.disambiguating_description IS 'Short disambiguating description from Zurich API';
COMMENT ON COLUMN landmarks.title_teaser IS 'Teaser title from Zurich API';
COMMENT ON COLUMN landmarks.text_teaser IS 'Teaser text from Zurich API';
COMMENT ON COLUMN landmarks.detailed_information IS 'Array of highlight points from Zurich API detailedInformation.en';
COMMENT ON COLUMN landmarks.zurich_card_description IS 'Description of Zurich Card benefits';
COMMENT ON COLUMN landmarks.zurich_card IS 'Whether this landmark accepts Zurich Card';
COMMENT ON COLUMN landmarks.api_categories IS 'Array of category names from Zurich API category object keys';
COMMENT ON COLUMN landmarks.image_caption IS 'Caption for the main image';
COMMENT ON COLUMN landmarks.price IS 'Price information from Zurich API';
COMMENT ON COLUMN landmarks.date_modified IS 'Last modified date from Zurich API';
COMMENT ON COLUMN landmarks.opens IS 'Opening time from Zurich API';
COMMENT ON COLUMN landmarks.opening_hours_specification IS 'Detailed opening hours specification as JSON';
COMMENT ON COLUMN landmarks.special_opening_hours IS 'Special opening hours text in English';
COMMENT ON COLUMN landmarks.address_country IS 'Country code (e.g., CH)';
COMMENT ON COLUMN landmarks.place IS 'Place type from Zurich API (e.g., Outdoors)';
COMMENT ON COLUMN landmarks.photo_0_url IS 'URL for photo gallery image 1';
COMMENT ON COLUMN landmarks.photo_0_caption IS 'Caption for photo gallery image 1';
COMMENT ON COLUMN landmarks.photo_1_url IS 'URL for photo gallery image 2';
COMMENT ON COLUMN landmarks.photo_1_caption IS 'Caption for photo gallery image 2';
COMMENT ON COLUMN landmarks.photo_2_url IS 'URL for photo gallery image 3';
COMMENT ON COLUMN landmarks.photo_2_caption IS 'Caption for photo gallery image 3';
