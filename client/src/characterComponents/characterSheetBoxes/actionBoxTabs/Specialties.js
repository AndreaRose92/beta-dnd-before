import React from 'react'
import { FeatureRow, FeatureTable } from '../../../styles/ActionBox.style'

export const Specialties = ({features}) => {
  
  let i = 0
  
  const orderedFeatures = features.sort((a,b) => a.level - b.level)

  const renderFeatures = orderedFeatures.map(feature => {
    return (
      <FeatureRow key={++i}>
        <h4>{feature.name}</h4>
        <p>{feature.desc}</p>
      </FeatureRow>
    )
  })
  
  return (
    <FeatureTable>{renderFeatures}</FeatureTable>
  )
}
