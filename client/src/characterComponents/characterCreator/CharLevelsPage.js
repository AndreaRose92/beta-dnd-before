import React, { useState } from 'react'
import { useOutletContext } from 'react-router-dom'
import { TabSelect } from '../../styles'
import { ButtonBox, LevelBox, LevelDetail } from '../../styles/Creator.style'

export const CharLevelsPage = () => {

    const context = useOutletContext()
    const [display, setDisplay] = useState(1)
    const [detail, setDetail] = useState({desc: null})

    const handleDisplay = e => {
        setDisplay(parseInt(e.target.value))
    }

    const handleDetail = data => {
        setDetail(data)
    }

    const renderDetail = detail.desc !== null ? <LevelDetail onClick={()=>setDetail({desc: null})} ><h2>{detail.name}</h2><h3>{detail.desc}</h3></LevelDetail> : null

    const features = context.returnData.features.filter(feature => feature.level === display)

  return (
    <React.Fragment>
        <LevelBox>
            <h2>Class Levels</h2>
            <h2>Class Options</h2>
            <Buttons display={display} levels={context.returnData.class_levels} handleDisplay={handleDisplay} variant={context.returnData.dnd_class.name} />
            <LevelMenu features={features} handleDetail={handleDetail} />
        </LevelBox>
        {renderDetail}
    </React.Fragment>
  )
}

const Buttons = ({display, levels, handleDisplay, variant}) => {

    const renderButtons = levels.map(level => {
        return (<TabSelect key={level.level} active={display === level.level} type='button' value={level.level} onClick={handleDisplay}>Level {level.level}</TabSelect>)
    })

    return (
        <ButtonBox variant={variant} >
            {renderButtons}
        </ButtonBox>
    )

}

const LevelMenu = ({features, handleDetail}) => {

    const renderInfo = features.map(feature => {
        return <div key={feature.name}><h4 onClick={()=>handleDetail(feature)}>{feature.name}</h4></div>
    })

    return (
        <div>
            {renderInfo}
        </div>
    )

}

