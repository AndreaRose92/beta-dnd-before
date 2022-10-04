import React from 'react';
import { TableRow } from '../../styles';
import { FullCaster } from '../../hookComponents';

export const WizardHeader = () => {
	return (
		<React.Fragment>
			<h2>Features</h2>
			<h2>Cantrips Known</h2>
			<FullCaster variant='Wizard'/>
		</React.Fragment>
	);
};

export const WizardRows = ({ levels, spells }) => {
	const renderRows =
		levels && spells
			? levels.map((level) => {
					let spell = level ? spells[level.level - 1] : null;

					return (
						<TableRow key={level.level} level={level.level} variant='Wizard'>
							<h2>{level.level}</h2>
							<h2>{level.prof_bonus}</h2>
							<h2>{level.features !== '' ? level.features : '-'}</h2>
							<h2>{spell.cantrips_known}</h2>
							<h4>{spell.lvl_1 !== 0 ? spell.lvl_1 : `-`}</h4>
							<h4>{spell.lvl_2 !== 0 ? spell.lvl_2 : `-`}</h4>
							<h4>{spell.lvl_3 !== 0 ? spell.lvl_3 : `-`}</h4>
							<h4>{spell.lvl_4 !== 0 ? spell.lvl_4 : `-`}</h4>
							<h4>{spell.lvl_5 !== 0 ? spell.lvl_5 : `-`}</h4>
							<h4>{spell.lvl_6 !== 0 ? spell.lvl_6 : `-`}</h4>
							<h4>{spell.lvl_7 !== 0 ? spell.lvl_7 : `-`}</h4>
							<h4>{spell.lvl_8 !== 0 ? spell.lvl_8 : `-`}</h4>
							<h4>{spell.lvl_9 !== 0 ? spell.lvl_9 : `-`}</h4>
						</TableRow>
					);
			  })
			: null;

	return <React.Fragment>{renderRows}</React.Fragment>;
};
