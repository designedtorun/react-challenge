insert into
  "Site" (created_at, updated_at, site_name)
values
  (now(), now(), 'New Site 1');

insert into
  "Site" (created_at, updated_at, site_name)
values
  (now(), now(), 'New Site 2');

insert into
  "Site" (created_at, updated_at, site_name)
values
  (now(), now(), 'New Site 3');

insert into
  "Headline" (created_at, text, site_id)
values
  (now(), 'Site 1 Headline', 1);

insert into
  "Headline" (created_at, text, site_id)
values
  (now(), 'Site 2 Headline', 2);

insert into
  "Headline" (created_at, text, site_id)
values
  (now(), 'Site 3 Headline', 3);

insert into
  "URL" (created_at, text, site_id)
values
  (now(), 'www.site-1-url.com', 1);

insert into
  "URL" (created_at, text, site_id)
values
  (now(), 'www.site-2-url.com', 2);

insert into
  "URL" (created_at, text, site_id)
values
  (now(), 'www.site-3-url.com', 3);

insert into
  "BodyCopy" (created_at, text, site_id)
values
  (now(), 'Site 1 lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1);

insert into
  "BodyCopy" (created_at, text, site_id)
values
  (now(), 'Site 2 lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2);

insert into
  "BodyCopy" (created_at, text, site_id)
values
  (now(), 'Site 3 lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 3);