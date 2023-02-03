insert into pok_pokemon (mon_dex_num, mon_eng_name) values (1, 'Bulbasaur');
select * from pok_pokemon;

insert into pok_generation (gen_num, gen_comp, gen_core_games)
values (8, 0, 'Sword/Shield');

insert into pok_stats (mon_dex_num, gen_num, gen_comp, sta_base_hp,
sta_base_attack, sta_base_spe_a);

desc pok_mon_stats;