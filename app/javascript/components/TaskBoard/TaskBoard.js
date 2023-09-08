import React from 'react';
import Board from '@asseinfo/react-kanban';
import '@asseinfo/react-kanban/dist/styles.css';
import { createRoot } from 'react-dom/client';

const data = {
  columns: [
    {
      id: 1,
      title: 'Backlog',
      cards: [
        {
          id: 1,
          title: 'Add card',
          description: 'Add capability to add a card in a column',
        },
      ],
    },
    {
      id: 2,
      title: 'Doing',
      cards: [
        {
          id: 2,
          title: 'Drag-n-drop support',
          description: 'Move a card between the columns',
        },
      ],
    },
  ],
};

function TaskBoard() {
  return <Board disableColumnDrag initialBoard={data} />;
}

window.addEventListener('DOMContentLoaded', () => {
  const root = createRoot(document.getElementById('TaskBoard'));

  root.render(<TaskBoard />);
});

export default TaskBoard;