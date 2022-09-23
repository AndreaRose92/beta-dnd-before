import React from 'react'
import { StatBox } from '../../styles/CharacterSheetGrids.style';

const StatGrid = ({stats}) => {
    const renderStats = stats.map((stat) => {
        return (
          <StatBox key={stat.name}>
            <div>
              <div><p>{stat.name}</p></div>
              <div className='mid'><h2>{stat.modifier}</h2></div>
              <div className='bottom'><h4>{stat.value}</h4></div>
            </div>
          </StatBox>
        );
      });
    
    return (
        <React.Fragment>
            {renderStats}
        </React.Fragment>
    )
}

export default StatGrid