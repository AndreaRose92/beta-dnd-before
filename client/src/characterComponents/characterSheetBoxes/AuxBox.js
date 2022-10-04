import React, { useState } from "react";
import { AuxiliaryBox, InspirationBox } from "../../styles";

export const AuxBox = ({ race, prof_bonus }) => {
    const [isInspired, setIsInspired] = useState(false);

    const handleInspiration = () => {setIsInspired((pv) => !pv);};

    return (
        <React.Fragment>
            <AuxiliaryBox>
                <div>
                    <div><p>WALKING</p></div>
                    <div className='mid'>
                        <h2>{race.speed}</h2>
                        <h4>{`ft.`}</h4>
                    </div>
                    <div className='bottom'><h4>SPEED</h4></div>
                </div>
            </AuxiliaryBox>
            <AuxiliaryBox>
                <div>
                    <div><p>PROFICIENCY</p></div>
                    <div className='mid'><h2>+{prof_bonus}</h2></div>
                    <div className='bottom'><h4>BONUS</h4></div>
                </div>
            </AuxiliaryBox>
            <InspirationBox>
                <div>
                    <div onClick={handleInspiration} className='inspiration-box'><h1>{isInspired ? '☀︎' : ''}</h1></div>
                    <div className='bottom'><h4>INSPIRATION</h4></div>
                </div>
            </InspirationBox>
        </React.Fragment>
    );
};    