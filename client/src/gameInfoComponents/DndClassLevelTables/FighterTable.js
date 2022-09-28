import React from 'react';
import { TableRow } from '../../styles';

export const FighterHeader = () => {
	return (
		<React.Fragment>
			<h2>Action Surges</h2>
			<h2>Extra Attacks</h2>
			<h2>Indomitable Uses</h2>
			<h2>Features</h2>
		</React.Fragment>
	);
};

export const FighterRows = ({ levels }) => {
	const renderRows = levels
		? levels.map((level) => {
				return (
					<TableRow key={level.level} level={level.level} variant='Fighter'>
						<h2>{level.level}</h2>
						<h2>{level.prof_bonus}</h2>
						<h2>{level.action_surges !== 0 ? level.action_surges : '-'}</h2>
						<h2>{level.extra_attacks !== 0 ? level.extra_attacks : '-'}</h2>
						<h2>{level.indomitable_uses !== 0 ? level.indomitable_uses : '-'}</h2>
						<h2>{level.features !== '' ? level.features : '-'}</h2>
					</TableRow>
				);
		  })
		: null;

	return <React.Fragment>{renderRows}</React.Fragment>;
};
