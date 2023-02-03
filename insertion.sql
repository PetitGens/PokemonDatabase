insert into pok_pokemon (mon_dex_num, mon_eng_name) values (1, 'Bulbasaur');
select * from pok_pokemon;

insert into pok_generation (gen_num, gen_comp, gen_core_games)
values (8, 0, 'Sword/Shield');

insert into pok_mon_stats (mon_dex_num, gen_num, gen_comp,
sta_base_hp, sta_base_attack, sta_base_defense ,sta_base_spe_attack, sta_base_spe_defense, sta_base_speed)
values (1, 8, 0, 45, 49, 49, 65, 65, 45);

insert into pok_offensive_category values ('p', 'physical');
insert into pok_offensive_category values ('t', 'status');
insert into pok_offensive_category values ('s', 'special');

insert into pok_type (typ_num, typ_eng_name)
values (0, '???');
insert into pok_type (typ_num, typ_eng_name, mov_cat_code)
values (4, 'poison', 'p');
insert into pok_type (typ_num, typ_eng_name, mov_cat_code)
values (12, 'grass', 's');

insert into pok_mon_is_type values (1, 4);
insert into pok_mon_is_type values (1, 12);