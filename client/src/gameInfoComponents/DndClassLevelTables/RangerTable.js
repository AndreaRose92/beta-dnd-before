import React from 'react';
import { HalfCaster } from '../../hookComponents';
import { TableRow } from '../../styles';

export const RangerHeader = () => {
	return (
		<React.Fragment>
			<h2>Features</h2>
			<h2>Spells Known</h2>
			<HalfCaster variant='Ranger'/>
		</React.Fragment>
	);
};

export const RangerRows = ({ levels, spells }) => {
	const renderRows =
		levels && spells
			? levels.map((level) => {
					let spell = level ? spells[level.level - 1] : null;

					return (
						<TableRow key={level.level} level={level.level} variant='Ranger'>
							<h2>{level.level}</h2>
							<h2>{level.prof_bonus}</h2>
							<h2>{level.features !== '' ? level.features : '-'}</h2>
							<h4>{spell.lvl_1 !== 0 ? spell.lvl_1 : `-`}</h4>
							<h4>{spell.lvl_2 !== 0 ? spell.lvl_2 : `-`}</h4>
							<h4>{spell.lvl_3 !== 0 ? spell.lvl_3 : `-`}</h4>
							<h4>{spell.lvl_4 !== 0 ? spell.lvl_4 : `-`}</h4>
							<h4>{spell.lvl_5 !== 0 ? spell.lvl_5 : `-`}</h4>
						</TableRow>
					);
			  })
			: null;

	return <React.Fragment>{renderRows}</React.Fragment>;
};
