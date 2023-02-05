truncate table vertex;

truncate table edge;

create table vertex (
  id int auto_increment primary key,
  properties json not null
);

create table edge (
  id int auto_increment primary key,
  tail_vertex int references vertex(id),
  head_vertex int references vertex(id),
  label text,
  properties json
);

insert into
  vertex (properties)
values
  (
    '{ "name": "satvik", "age": 23, "type": "person", "gender": "male" }'
  ),
  (
    '{ "name": "keshav", "age": 23, "type": "person", "gender": "male" }'
  ),
  (
    '{ "name": "kartik", "age": 22, "type": "person", "gender": "male" }'
  ),
  (
    '{ "name": "piyush", "age": 23, "type": "person", "gender": "male" }'
  ),
  (
    '{ "name": "khevna", "age": 22, "type": "person", "gender": "female" }'
  ),
  (
    '{ "name": "lakshita", "age": 24, "type": "person", "gender": "female" }'
  ),
  (
    '{ "name": "eknoor", "age": 24, "type": "person", "gender": "female" }'
  ),
  (
    '{ "name": "kharghar", "type": "location", "entity": "town" }'
  ),
  (
    '{ "name": "India", "type": "location", "entity": "country" }'
  ),
  (
    '{ "name": "usa", "type": "location", "entity": "country" }'
  ),
  (
    '{ "name": "bangalore", "type": "location", "entity": "city" }'
  ),
  (
    '{ "name": "tamil nadu", "type": "location", "entity": "state" }'
  ),
  (
    '{ "name": "vellore", "type": "location", "entity": "village" }'
  ),
  (
    '{ "name": "chennai", "type": "location", "entity": "city" }'
  ),
  (
    '{ "name": "uttarkhand", "type": "location", "entity": "state" }'
  ),
  (
    '{ "name": "rishikesh", "type": "location", "entity": "city" }'
  ),
  (
    '{ "name": "Mumbai", "type": "location", "entity": "city" }'
  ),
  (
    '{ "name": "Maharashtra", "type": "location", "entity": "state" }'
  ),
  (
    '{ "name": "kolkata", "type": "location", "entity": "city" }'
  ),
  (
    '{ "name": "west bengal", "type": "location", "entity": "state" }'
  ),
  (
    '{ "name": "delhi", "type": "location", "entity": "city" }'
  ),
  (
    '{ "name": "punjab", "type": "location", "entity": "state" }'
  );

-- born in
insert into
  edge (tail_vertex, head_vertex, label)
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'satvik'
  ) as tail_vertex,
  id as head_vertex,
  'born_in'
from
  vertex
where
  properties -> '$.name' = 'kharghar'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'keshav'
  ) as tail_vertex,
  id as head_vertex,
  'born_in'
from
  vertex
where
  properties -> '$.name' = 'kolkata'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'eknoor'
  ) as tail_vertex,
  id as head_vertex,
  'born_in'
from
  vertex
where
  properties -> '$.name' = 'punjab'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'lakshita'
  ) as tail_vertex,
  id as head_vertex,
  'born_in'
from
  vertex
where
  properties -> '$.name' = 'mumbai'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'kartik'
  ) as tail_vertex,
  id as head_vertex,
  'born_in'
from
  vertex
where
  properties -> '$.name' = 'delhi'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'khevna'
  ) as tail_vertex,
  id as head_vertex,
  'born_in'
from
  vertex
where
  properties -> '$.name' = 'kolkata'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'piyush'
  ) as tail_vertex,
  id as head_vertex,
  'born_in'
from
  vertex
where
  properties -> '$.name' = 'kolkata';

-- works in 
insert into
  edge (tail_vertex, head_vertex, label)
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'satvik'
  ) as tail_vertex,
  id as head_vertex,
  'works_in'
from
  vertex
where
  properties -> '$.name' = 'bangalore'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'keshav'
  ) as tail_vertex,
  id as head_vertex,
  'works_in'
from
  vertex
where
  properties -> '$.name' = 'rishikesh'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'eknoor'
  ) as tail_vertex,
  id as head_vertex,
  'works_in'
from
  vertex
where
  properties -> '$.name' = 'bangalore'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'lakshita'
  ) as tail_vertex,
  id as head_vertex,
  'works_in'
from
  vertex
where
  properties -> '$.name' = 'mumbai'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'kartik'
  ) as tail_vertex,
  id as head_vertex,
  'works_in'
from
  vertex
where
  properties -> '$.name' = 'hyderabad'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'khevna'
  ) as tail_vertex,
  id as head_vertex,
  'works_in'
from
  vertex
where
  properties -> '$.name' = 'mumbai'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'piyush'
  ) as tail_vertex,
  id as head_vertex,
  'works_in'
from
  vertex
where
  properties -> '$.name' = 'bangalore';

-- studies_in
insert into
  edge (tail_vertex, head_vertex, label)
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'satvik'
  ) as tail_vertex,
  id as head_vertex,
  'studies_in'
from
  vertex
where
  properties -> '$.name' = 'vellore'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'keshav'
  ) as tail_vertex,
  id as head_vertex,
  'studies_in'
from
  vertex
where
  properties -> '$.name' = 'vellore'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'eknoor'
  ) as tail_vertex,
  id as head_vertex,
  'studies_in'
from
  vertex
where
  properties -> '$.name' = 'vellore'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'lakshita'
  ) as tail_vertex,
  id as head_vertex,
  'studies_in'
from
  vertex
where
  properties -> '$.name' = 'mumbai'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'kartik'
  ) as tail_vertex,
  id as head_vertex,
  'studies_in'
from
  vertex
where
  properties -> '$.name' = 'vellore'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'khevna'
  ) as tail_vertex,
  id as head_vertex,
  'studies_in'
from
  vertex
where
  properties -> '$.name' = 'chennai'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'piyush'
  ) as tail_vertex,
  id as head_vertex,
  'studies_in'
from
  vertex
where
  properties -> '$.name' = 'vellore';

-- is_within
insert into
  edge (tail_vertex, head_vertex, label)
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'kharghar'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'mumbai'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'mumbai'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'maharashtra'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'maharashtra'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'india'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'delhi'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'india'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'kolkata'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'west bengal'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'west bengal'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'india'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'hyderabad'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'telangana'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'telangana'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'india'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'punjab'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'india'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'chennai'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'tamil nadu'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'bangalore'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'tamil nadu'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'vellore'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'tamil nadu'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'tamil nadu'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'india'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'rishikesh'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'uttarkhand'
union
all
select
  (
    select
      id
    from
      vertex
    where
      properties -> '$.name' = 'uttarkhand'
  ) as tail_vertex,
  id as head_vertex,
  'is_within'
from
  vertex
where
  properties -> '$.name' = 'india';

-- all people to who work in tamil nadu
with recursive tamil_nadu_locations as (
  select
    id
  from
    vertex
  where
    properties -> '$.name' = 'tamil nadu'
  union
  select
    edge.tail_vertex
  from
    edge
    inner join tamil_nadu_locations on edge.head_vertex = tamil_nadu_locations.id
    and edge.label = 'is_within'
),
people_in_tamil_nadu as (
  select
    edge.tail_vertex as id
  from
    edge
    inner join tamil_nadu_locations on edge.head_vertex = tamil_nadu_locations.id
    and edge.label = 'works_in'
)
select
  v.properties -> '$.name'
from
  vertex v
  inner join people_in_tamil_nadu on v.id = people_in_tamil_nadu.id;