import React from 'react'
import { useParams } from 'react-router-dom'

const DeleteMessage = () => {
    const params = useParams()

  return (
    <div>Sorry to see you go, {params.username}</div>
  )
}

export default DeleteMessage