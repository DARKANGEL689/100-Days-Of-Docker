const request = require('supertest');
const app = require('./server');

describe('API Health Check', () => {
    it('should return 200 OK and status UP', async () => {
        const response = await request(app).get('/health');
        expect(response.statusCode).toBe(200);
        expect(response.body.status).toBe('UP');
    });
});