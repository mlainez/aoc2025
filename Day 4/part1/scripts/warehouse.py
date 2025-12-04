
import numpy as np


class Warehouse:
    def __init__(self, grid):
        self.grid = grid

    def get_grid(self):
        return self.grid

    def rows(self):
        return len(self.grid)

    def cols(self):
        return len(self.grid[0])

    def create_neighbor_count_map(self):
        grid = self._create_grid(self.grid)
        occupancy = (grid != '.').astype(int)
        p = np.pad(occupancy, pad_width=1, mode='constant', constant_values=0)
        count_map = (
            p[:-2, :-2] + p[:-2, 1:-1] + p[:-2, 2:]
            + p[1:-1, :-2] + p[1:-1, 2:]
            + p[2:, :-2] + p[2:, 1:-1] + p[2:, 2:]
        )
        return count_map

    def _create_grid(self, warehouse):
        row_count = len(warehouse)
        col_count = max((len(r) for r in warehouse), default=0)
        grid = np.full((row_count, col_count), '.', dtype='<U1')
        for row_index, row_values in enumerate(warehouse):
            for col_index, cell_value in enumerate(row_values):
                grid[row_index, col_index] = cell_value
        return grid

