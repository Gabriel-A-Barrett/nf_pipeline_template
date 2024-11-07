import nextflow.Nextflow


class WorkflowVariantFiltering {

    public static void initialise(workflow, params, log) {
        if (!params.vcf) {
            log.error "Need to provide --vcf </path/to/vcf> or via a detectable config"
        }
    }
}