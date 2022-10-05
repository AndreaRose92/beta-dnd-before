import React from 'react';
import { ProficiencyBox } from '../../styles';

export const EditSkills = ({skills, handleSkills}) => {
	const renderSkills = skills.map((skill) => {

		return (
			<React.Fragment key={skill.name}>
				<h3>{skill.is_proficient ? '●' : '○'} </h3>
				<h3>{skill.stat.slice(0, 3)}</h3>
				<h3 className='skill'>{skill.name}</h3>
				<input name={skill.name} type='checkbox' defaultChecked={skill.is_proficient} onChange={handleSkills} disabled={skill.is_proficient}/>
			</React.Fragment>
		);
	});

	return (
		<ProficiencyBox>
			<div className='pro-header'>
				<p>PROF.</p>
				<p>MODIFIER</p>
				<p className='skill'>SKILL</p>
			</div>
			<div className='pro-grid'>{renderSkills}</div>
		</ProficiencyBox>
	);
};
