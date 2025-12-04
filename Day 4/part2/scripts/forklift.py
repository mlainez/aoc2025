class Forklift:
    def lift(self, warehouse, position, neighbors_count_map):
        col, row = position
        if warehouse[row][col] == '.':
            return False

        if int(neighbors_count_map[row, col]) < 4:
            warehouse[row][col] = '.'
            return True
        return False
