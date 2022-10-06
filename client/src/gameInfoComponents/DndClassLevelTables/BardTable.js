import React from 'react';
import { FullCaster } from '../../hookComponents';
import { TableRow } from '../../styles';

export const BardHeader = () => {
	return (
		<React.Fragment>
			<h2>Bardic Inspiration</h2>
			<h2>Song of Rest</h2>
			<h2>Features</h2>
			<h2>Cantrips Known</h2>
			<h2>Spells Known</h2>
			<FullCaster variant='Bard'/>
		</React.Fragment>
	);
};

export const BardRows = ({ levels }) => {
	const renderRows =
		levels
			? levels.map((level) => {

					return (
						<TableRow key={level.level} level={level.level} variant='Bard'>
							<h2>{level.level}</h2>
							<h2>{level.prof_bonus}</h2>
							<h2>d{level.bardic_inspiration_die}</h2>
							<h2>
								{level.song_of_rest_die ? `d${level.song_of_rest_die}` : 'n/a'}
							</h2>
							<h2>{level.features !== '' ? level.features : '-'}</h2>
							<h2>{level.cantrips_known}</h2>
							<h2>{level.spells_known}</h2>
							<h4>{level.lvl_1 !== 0 ? level.lvl_1_spell_slots : `-`}</h4>
							<h4>{level.lvl_2 !== 0 ? level.lvl_2_spell_slots : `-`}</h4>
							<h4>{level.lvl_3 !== 0 ? level.lvl_3_spell_slots : `-`}</h4>
							<h4>{level.lvl_4 !== 0 ? level.lvl_4_spell_slots : `-`}</h4>
							<h4>{level.lvl_5 !== 0 ? level.lvl_5_spell_slots : `-`}</h4>
							<h4>{level.lvl_6 !== 0 ? level.lvl_6_spell_slots : `-`}</h4>
							<h4>{level.lvl_7 !== 0 ? level.lvl_7_spell_slots : `-`}</h4>
							<h4>{level.lvl_8 !== 0 ? level.lvl_8_spell_slots : `-`}</h4>
							<h4>{level.lvl_9 !== 0 ? level.lvl_9_spell_slots : `-`}</h4>
						</TableRow>
					);
			  })
			: null;

	return <React.Fragment>{renderRows}</React.Fragment>;
};
