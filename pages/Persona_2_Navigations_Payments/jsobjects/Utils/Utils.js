export default {
	// updateStatus: async () => {
	// storeValue('tableIndex',tbl_application.selectedRowIndex);
	// await updateApplicationStatus.run();
	// if (applicant_status_dropdown.selectedOptionValue === 'Interview Scheduled' || 
	// applicant_status_dropdown.selectedOptionValue === 'Interview Done' || 
	// applicant_status_dropdown.selectedOptionValue === 'Offer Made' || 
	// applicant_status_dropdown.selectedOptionValue === 'Offer Accepted') {
	// await updateInterviewNote.run();
	// await this.filteredApplications();
	// showAlert('Application Updated!', 'success');
	// }
	// if (applicant_status_dropdown.selectedOptionValue === 'Offer Rejected' || 
	// applicant_status_dropdown.selectedOptionValue === 'Candidate Rejected') {
	// await updateRejectionComment.run();
	// await this.filteredApplications();
	// showAlert('Application Updated!', 'success');
	// }
	// await this.filteredApplications();
	// showAlert('Application Updated!', 'success');
	// },

	dropdownData: async () => {
		const dataArray = await getAllApplications.run();
		let uniqueLocations = new Set();
		let uniqueRoles = new Set();
		let uniqueStatuses = new Set();

		dataArray.forEach(candidate => {
			uniqueLocations.add(candidate.country);
			uniqueRoles.add(candidate.applied_role);
			uniqueStatuses.add(candidate.application_status);
		});

		let formatSetToArray = (set) => {
			let array = Array.from(set);
			return array.map(item => ({label: item, value: item}));
		};

		return {
			location: formatSetToArray(uniqueLocations),
			applied_role: formatSetToArray(uniqueRoles),
			application_status: formatSetToArray(uniqueStatuses)
		};
	},

	filteredApplications: async () => {
		const allApplications = await getAllApplications.run();
		const statusFilter = sel_status.selectedOptionValue;
		const roleFilter = sel_role.selectedOptionValue;
		const locationFilter = sel_location.selectedOptionValue;

		return allApplications.filter(application => {
			const statusMatch = !statusFilter || statusFilter === '' || statusFilter === 'All' || application.application_status === statusFilter;
			const roleMatch = !roleFilter || roleFilter === '' || roleFilter === 'All' || application.applied_role === roleFilter;
			const locationMatch = !locationFilter || locationFilter === '' || locationFilter === 'All' || application.country === locationFilter;

			return statusMatch && roleMatch && locationMatch;
		});
	},


	dataCount: async () => {
		const dataArray = await getAllApplications.run();
		let counts = {
			all: dataArray.length,
			hired: 0, // 'Offer Accepted'
			interviewed: 0, // 'Interview Done'
			in_assessment: 0, // 'Offer Made'
			in_review: 0 // 'Interview Done'
		};

		dataArray.forEach(application => {
			switch (application.application_status) {
				case 'Offer Accepted':
					counts.hired += 1;
					break;
				case 'Interview Done':
					counts.interviewed += 1;
					counts.in_review += 1;
					break;
				case 'Offer Made':
					counts.in_assessment += 1;
					break;
				default:
					break;
			}
		});

		return counts;
	},
}