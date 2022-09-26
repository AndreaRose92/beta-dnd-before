import React from 'react';
import { TableRow } from '../../styles/Details.style';

export const WarlockHeader = () => {
	return (
		<React.Fragment>
			<h2>Features</h2>
			<h2>Cantrips Known</h2>
			<h2>SpellsKnown</h2>
			<h2>Spell Slots</h2>
			<h2>Slot Level</h2>
			<h2>Invocations Known</h2>
		</React.Fragment>
	);
};

export const WarlockRows = ({ levels, spells }) => {
	const renderRows =
		levels && spells
			? levels.map((level) => {
					let spell = level ? spells[level.level - 1] : null;
					return (
						<TableRow key={level.level} level={level.level} variant='Warlock'>
							<h2>{level.level}</h2>
							<h2>{level.prof_bonus}</h2>
							<h2>{level.features !== '' ? level.features : '-'}</h2>
							<h2>{spell.cantrips_known}</h2>
							<h2>{spell.spells_known}</h2>
							<h2>{spell.spells_known}</h2>
							<h2>{spell.warlock_slot}</h2>
							<h2>{level.invocations_known}</h2>
						</TableRow>
					);
			  })
			: null;

	return <React.Fragment>{renderRows}</React.Fragment>;
};
