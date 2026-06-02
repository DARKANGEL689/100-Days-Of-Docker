const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/health', (req, res) => {
    res.status(200).json({ status: 'UP', message: 'Enterprise CI/CD Pipeline Operational' });
});

app.get('/api/data', (req, res) => {
    res.status(200).json({ data: [1, 2, 3], source: 'GitHub Actions Build' });
});

if (require.main === module) {
    app.listen(PORT, () => {
        console.log(`Server listening on port ${PORT}`);
    });
}

module.exports = app; 
app.get('/devsecops', (req, res) => {
    res.status(200).json({ status: 'SECURE', message: 'Trivy Scanning and Linting Active' });
});
