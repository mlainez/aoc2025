const idValidator = require('../src/id_validator');

describe('IdValidator', () => {
  describe('valid', () => {
    it('should mark 11 as invalid', () => {
      expect(idValidator.valid(11)).toBe(false);
    });

    it('should mark 112 as valid', () => {
      expect(idValidator.valid(112)).toBe(true);
    });

    it('should mark 1188511885 as invalid', () => {
      expect(idValidator.valid(1188511885)).toBe(false);
    });
  });

  describe('extractRange', () => {
    it('should extract range from "111111-222222"', () => {
      const range = idValidator.extractRange("111111-222222");
      expect(range.start).toBe(111111);
      expect(range.end).toBe(222222);
    });

    it('should extract range from "38593856-38593862"', () => {
      const range = idValidator.extractRange("38593856-38593862");
      expect(range.start).toBe(38593856);
      expect(range.end).toBe(38593862);
    });
  });

  describe('extractInvalidIdsFromRange', () => {
    it('should extract 11 and 22 as invalid IDs from range 11-22', () => {
      const range = { start: 11, end: 22 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([11, 22]);
    });

    it('should extract 99 as invalid IDs from range 95-115', () => {
      const range = { start: 95, end: 115 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([99]);
    });

    it('should extract 38593859 as invalid IDs from range 38593856-38593862', () => {
      const range = { start: 38593856, end: 38593862 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([38593859]);
    });
  });
});
